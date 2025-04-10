require File.expand_path('../../test_helper', __FILE__)

class MotivationCenterTest < Redmine::IntegrationTest
  fixtures :users, :email_addresses, :roles, :projects, :members, :member_roles

  def setup
    # Set up initial message
    Setting.plugin_motivation_center = { 'message' => 'Initial motivation message' }

    # Set up project and roles for testing
    @project = Project.find(1)
    @admin = User.find(1)
    @user = User.find(2)
  end

  def test_motivation_center_workflow_as_admin
    # Log in as admin
    log_user('admin', 'admin')

    # Visit the motivation center settings page
    get '/motivation'
    assert_response :success
    assert_select 'textarea[name=?]', 'message'
    assert_select 'form[action=?][method=post]', '/motivation/update'

    # Update the motivation message
    new_message = 'Stay motivated and keep coding!'
    post '/motivation/update', params: { message: new_message }
    assert_redirected_to '/motivation'
    follow_redirect!

    assert_response :success
    assert_select 'div.flash.notice', 'Motivational message updated.'
    assert_select 'textarea[name=?]', 'message' do |elements|
      assert_equal new_message, elements.first.content.strip
    end
  end

  def test_motivation_center_workflow_as_regular_user
    # Log in as regular user
    log_user('jsmith', 'jsmith')

    # Try to access motivation center settings
    get '/motivation'
    assert_response 403
    assert_select '#errorExplanation', 'You are not authorized to access this page.'

    # Try to update motivation message
    post '/motivation/update', params: { message: 'This should not work' }
    assert_response 403

    # Verify message wasn't changed
    assert_equal 'Initial motivation message', Setting.plugin_motivation_center['message']
  end

  def test_motivation_center_workflow_as_anonymous
    # Try to access motivation center settings without logging in
    get '/motivation'
    assert_redirected_to %r{/login}
    assert_match /back_url=.*motivation/, response.redirect_url

    # Try to update motivation message
    post '/motivation/update', params: { message: 'This should not work' }
    assert_redirected_to %r{/login}

    # Verify message wasn't changed
    assert_equal 'Initial motivation message', Setting.plugin_motivation_center['message']
  end

  private

  def log_user(login, password)
    get '/login'
    assert_response :success
    post '/login', params: {
      username: login,
      password: password
    }
    assert_redirected_to '/my/page'
    follow_redirect!
    assert_equal login, User.find(session[:user_id]).login
  end
end
