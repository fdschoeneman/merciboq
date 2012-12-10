class ConfirmationsController < Devise::ConfirmationsController

  def show
    @title = "Step 2: Choose password" 

    if @user = User.find_by_confirmation_token(params[:confirmation_token])
      if !@user.present?
        render_with_scope :new
      end
    else
      render :root
    end
  end

  def confirm_user
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    if @user.update_attributes(params[:user]) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in("user", @user)
      redirect_to after_signup_wizard_path(:choose_subdomain)
    else
      render :action => "show"
    end
  end

end

