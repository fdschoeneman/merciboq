class SessionsController < Devise::SessionsController

  def new
    @title = "Login"
    super
  end

  def create
#    user = User.authenticate(params[:session][:email],
#                             params[:session][:password])
#    if user.nil?
#      flash.now[:error] = "Invalid email or password combo"
#        render 'new'
#    else
#      super
#    end
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

end

