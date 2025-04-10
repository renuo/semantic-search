require File.expand_path('../../test_helper', __FILE__)

class MotivationControllerTest < ActionController::TestCase
  fixtures :users, :email_addresses

  def setup
    @request.session[:user_id] = 1
    Setting.plugin_motivation_center = { 'message' => 'Initial message' }
  end

  def test_index_by_admin
    get :index
    assert_response :success
    assert_template 'index'
    assert_equal 'Initial message', assigns(:message)
  end

  def test_index_by_non_admin
    @request.session[:user_id] = 2
    get :index
    assert_response 403
  end

  def test_update_by_admin
    new_message = 'Updated motivation message'
    post :update, params: { message: new_message }

    assert_redirected_to action: 'index'
    assert_equal 'Motivational message updated.', flash[:notice]
    assert_equal new_message, Setting.plugin_motivation_center['message']
  end

  def test_update_by_non_admin
    @request.session[:user_id] = 2
    post :update, params: { message: 'Should not update' }

    assert_response 403
    assert_equal 'Initial message', Setting.plugin_motivation_center['message']
  end
end
