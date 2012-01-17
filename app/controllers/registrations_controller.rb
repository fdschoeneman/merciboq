class RegistrationsController < Devise::RegistrationsController
  
  def new
    @title = "Sign up"
    super
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    # If the user has filled in any of the password fields, we'll update their password
    any_passwords = %w(password password_confirmation current_password).any? do |field|
      params[resource_name][field].present?
    end
    update_method = any_passwords ? :update_with_password : :update_without_password

    if resource.send(update_method, params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render_with_scope :edit }
    end
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
    super
  end

#  def after_sign_up_path_for(resource)
#    '/'
#  end
  
  def show
    @user = User.find(params[:id])
  end

end

