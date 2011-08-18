class WelcomesController < UsersController

  def show_welcomes
    @user = current_user
    @welcomes = @user.welcomes.page(params[:page])
    @title = "Welcomes"
  end

end

