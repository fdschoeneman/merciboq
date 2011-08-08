class RegistrationsController < Devise::RegistrationsController

  def new
    @title = "Sign up"
    super
  end

  def edit
    @title = "Settings"
  end

  def show
    @user = User.find(params[:id])
  end

end

