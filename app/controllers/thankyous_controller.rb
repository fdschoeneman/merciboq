class ThankyousController < UsersController

  def show
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @title = "Thankyous"
  end

end

