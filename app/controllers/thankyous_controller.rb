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
    @thankyou = Thankyou.find(params[:format])
    @title = "Edit thankyou"

    return unless request.put? or request.post?

    if @thankyou.update_attributes(params[:thankyou])
     redirect_to thankyous_url, :flash => { :notice => "Thankyou updated." }
    end
  end

  def delete
    @thankyou = Thankyou.find(params[:format])
    @thankyou.destroy
    redirect_to thankyous_url, :flash => { :notice => "Thankyou destroyed." }
  end

  def thankyous
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @title = "Thankyous"
#    @thankyou = Thankyou.new if signed_in?
  end

  def welcomes
    @user = current_user
    @welcomes = @user.welcomes.page(params[:page])
    @title = "welcomes"
#    @welcome = Welcome.new if signed_in?
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

