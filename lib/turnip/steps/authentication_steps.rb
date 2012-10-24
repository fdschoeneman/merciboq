module AuthenticationSteps

  step 'I am not logged in' do 
    Warden.test_mode!
    logout
  end

  step 'no user exists with an email of :email' do |email|
    User.find_by_email(email).should be nil
  end

  step 'I am registered and logged in as a/an :user_type' do |user_type|
    @actor = FactoryGirl.create(user_type.to_sym).confirm!
    login_as(@actor)
  end

  step 'I open the password reset email' do 
    open_email(@actor.email)
  end
end
