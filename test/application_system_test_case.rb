class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  setup do
    EmbeddingService.any_instance.stubs(:generate_embedding).returns(Array.new(1536) { 0.1 })
  end

  def log_user(login, password)
    visit '/login'
    fill_in 'username', with: login
    fill_in 'password', with: password
    click_button 'Login'
    assert_selector '#loggedas'
  end

  def logout
    visit '/logout'
    assert_no_selector '#loggedas'
  end
end
