class WelcomesController < UsersController

  def show
    @user = current_user
    @welcomes = @user.welcomes.page(params[:page])
    @title = "Welcomes"
  end

end

