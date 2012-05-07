class ThankyousController < UsersController

  def new
    @thankyou = Thankyou.new
    @title = "Sign up"
  end

  def create
    @thankyou = Thankyou.new(params[:thankyou])
    if current_user 
      @thankyou.thanker = current_user
    else
      @thankyou.thanker = User.find_or_create_by_email(params[:thankyou][:thanker])
    end
    @thankyou.welcomer = User.find_or_create_by_email(params[:thankyou][:welcomer])
    if @thankyou.save
      if current_user
        redirect_to root_url, flash: { notice: "Well played, sir" }
      else
        redirect_to root_url, flash: { notice: "check your email" }
      end
    else
      redirect_to root_url, flash: { notice: "oops" }
    end
  end

  def edit
    @thankyou = Thankyou.find(params[:format])
    @title = "Edit thankyou"

    return unless request.put? or request.post?

    if @thankyou.update_attributes(params[:thankyou])
      debugger
      redirect_to root_url, :flash => { :notice => "Thankyou updated." }
    else
      redirect to thankyous_url, flash: { notice: "oops" }
    end
  end

  def update
    @thankyou = Thankyou.find(params[:format])
    debugger
    if @thankyou.update_attributes(params[:thankyou])
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def delete
    @thankyou = Thankyou.find(params[:format])
    @thankyou.destroy
    redirect_to thankyous_url, :flash => { :notice => "Thankyou destroyed." }
  end

  def show_thankyous
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @thankyou = Thankyou.new if signed_in?
    @title = "Thankyous"
    @subdomain_logo = current_user.subdomain
  end

  def show_welcomes
    @user = current_user
    @welcomes = @user.welcomes.page(params[:page])
    @title = "Welcomes"
    @subdomain_logo = current_user.subdomain
  end
end

