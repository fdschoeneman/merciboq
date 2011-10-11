class ConfirmationsController < Devise::ConfirmationsController

  def show
    @title = "Confirm your account"
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    @user.name = temporary_name(@user.email)
    if !@user.present?
      render_with_scope :new
    end
  end

  def confirm_user
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    if @user.update_attributes(params[:user]) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect("user", @user)
#      super
    else
      render :action => "show"
    end
  end

end

