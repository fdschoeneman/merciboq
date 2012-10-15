  Dir[Rails.root.join("spec/acceptance/**/*.rb")].each {|f| require f}

RSpec.configure { |c| c.include SignUpSteps }
