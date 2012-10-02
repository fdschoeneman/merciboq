module ControllerMacros

  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in create(:admin)
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @logged_in_user = create(:user)
      @logged_in_user.confirm!
      sign_in @logged_in_user
    end
  end

  def login(user)
    post user_session_path, login: user.email, password: 'password'
  end
end