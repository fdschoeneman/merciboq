class SessionsController < Devise::SessionsController

  def new
    @title = "Login"
    super
  end

end

