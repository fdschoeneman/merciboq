class ThankyousController < UsersController

  def show_thankyous
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @title = "Thankyous"
  end

  def show_welcomes
    @user = current_user
    @welcomes = @user.thankyous.page(params[:page])
    @title = "Welcomes"
  end
end

