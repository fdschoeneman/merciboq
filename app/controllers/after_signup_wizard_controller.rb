class AfterSignupWizardController < ApplicationController
  include Wicked::Wizard
  steps :choose_password, :choose_subdomain

  def show
    @user = current_user
    case step
      when :choose_password
        @title = "Step 2: Choose password"
      when :choose_subdomain
        @title = "Step 3: Choose subdomain"
      end
    render_wizard
  end

  def update
    @user = current_user
    case step
    when :choose_password
      @user.update_attributes(params[:user])
    when :choose_subdomain
      if @user.update_attributes(params[:user])
        render :user_thankyous
      else 
        render nothing: true
      end
    end
    sign_in(@user, bypass: true)
    render_wizard @user
  end
end
