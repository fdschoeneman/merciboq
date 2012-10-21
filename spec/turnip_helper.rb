Dir[Rails.root.join("spec/acceptance/steps/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/acceptance/steps*.rb")].each {|f| require f}
Dir[Rails.root.join("lib/turnip/steps/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include SignUpSteps 
  config.include AuthenticationSteps
  config.include UtilitySteps
  config.include EmailHandlingSteps
end
