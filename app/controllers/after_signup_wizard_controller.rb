class AfterSignupWizardController < ApplicationController
  include Wicked::Wizard
  steps :choose_password, :choose_subdomain, :customize_profile

  def show
    @user = current_user
    case step
      when :choose_password
        @title = "Step 2"
      when :choose_subdomain
        @title = "Step 3"
      end
      render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    render_wizard
  end
end
