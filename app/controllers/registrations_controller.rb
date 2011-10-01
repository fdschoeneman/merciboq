class RegistrationsController < Devise::RegistrationsController

  def new
    @title = "Sign up"
    super
  end

  def edit
    @title = "Edit Settings"
  end

  def create
    email = params[:email]
    @user = User.create!(:email => email,
      :name => temporary_name(email),
      :subdomain => temporary_subdomain(email))
    super
  end

  def show
    @user = User.find(params[:id])
  end

end

