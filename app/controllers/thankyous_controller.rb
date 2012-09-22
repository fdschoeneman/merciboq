class ThankyousController < UsersController

  def index
  end

  def new
    @thankyou = Merciboku.new
    @title = "Sign up"
  end

  def create
    @thankyou = Merciboku.new(params[:thankyou])
    if current_user 
      @thankyou.thanker = current_user
    else
      @thankyou.thanker = User.find_or_create_by_email(params[:merciboku][:thanker])
    end
    @thankyou.welcomer = User.find_or_create_by_email(params[:merciboku][:welcomer])
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
    @thankyou = Merciboku.find(params[:format])
    @title = "Edit thankyou"

    return unless request.put? or request.post?

    if @thankyou.update_attributes(params[:thankyou])
      redirect_to thankyous_url, :flash => { :notice => "Thankyou updated." }
    else
      redirect to thankyous_url, flash: { notice: "oops" }
    end
  end

  def update
    @thankyou = Merciboku.find(params[:format])
    if @thankyou.update_attributes(params[:thankyou])
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def delete
    @thankyou = Merciboku.find(params[:format])
    @thankyou.destroy
    redirect_to thankyous_url, :flash => { :notice => "Thankyou destroyed." }
  end

  def show_thankyous
    @user = current_user
    @thankyous = @user.thankyous.page(params[:page])
    @thankyou = Merciboku.new if signed_in?
    @title = "Thankyous"
    # debugger
    @subdomain_logo = current_user.subdomain
  end

  def show_welcomes
    @user = current_user
    @welcomes = @user.welcomes.page(params[:page])
    @title = "Welcomes"
    @subdomain_logo = current_user.subdomain
  end
end

