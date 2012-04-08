class AfterSignupWizardController < ApplicationController
  include Wicked::Wizard
  steps :choose_password, :choose_subdomain, :customize_profile

  def show
    @user = current_user
    case step
    when :choose_password
      @user = current_user
    end
    render_wizard
  end
end
