module AuthenticationSteps

  step 'I am not logged in' do 
    Warden.test_mode!
    logout
  end

  step 'I am logged in' do 
    Warden.test_mode!
    login(:user)
  end
end
