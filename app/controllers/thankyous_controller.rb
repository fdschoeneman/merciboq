class ThankyousController < UsersController

  def new
    @thankyou = Thankyou.new
    @title = "Sign up"
  end

  def create
    @thankyou = Thankyou.new(params[:thankyou])
##    current_user.thankyous.build(params[:thankyou])
##    if @thankyou.save
#      flash[:success] = "Thanks for saying thanks!"
#      redirect_to root_path
#    else
#      render 'thankyous/show'
#    end
  end

  def edit
    @thankyou = Thankyou.new
    @title = "Edit your Thankyou"
  end

  def show_thankyous
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @title = "Thankyous"
    @thankyou = Thankyou.new if signed_in?
  end

  def show_welcomes
    @user = current_user
    @welcomes = @user.thankyous.page(params[:page])
    @title = "Welcomes"
  end
end

