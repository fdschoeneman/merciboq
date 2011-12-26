class RegistrationsController < Devise::RegistrationsController

  def new
    @title = "Sign up"
    super
  end

  def edit
    @title = "Edit Settings"
    @subdomain_logo = current_user.subdomain
  end

  def create
    @user = User.create!(
      :email => params[:user][:email],
      :name => temporary_name(params[:user][:email]),
      :subdomain => temporary_subdomain(params[:user][:email])
    )
      set_flash_message :notice, :inactive_signed_up
      redirect_to root_url

#    super
  end

  def show
    @user = User.find(params[:id])
  end

end

