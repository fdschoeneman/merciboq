Dir[Rails.root.join("spec/acceptance/steps/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/acceptance/steps*.rb")].each {|f| require f}
Dir[Rails.root.join("lib/turnip/steps/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include AuthenticationSteps
  config.include EditSettingsSteps
  config.include EmailHandlingSteps
  config.include ReconfirmationSteps
  config.include RequestPasswordSteps
  config.include SignUpSteps 
  config.include ThankViaEmailSteps 
  config.include UtilitySteps

end
