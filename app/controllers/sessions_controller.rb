class SessionsController < Devise::SessionsController

  def new
    @title = "Login"
    super
  end

  def update
  end

    def show
    @user = User.find(params[:id])
  end

end

