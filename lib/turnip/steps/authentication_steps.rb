module AuthenticationSteps

  step 'I am not logged in' do 
    Warden.test_mode!
    logout
  end

  step 'no user exists with an email of :email' do |email|
    User.find_by_email(email).should be nil
  end
  
  step 'a user does exist with an email :registered_email' do |registered_email|
    User.create(email: registered_email)
    User.find_by_email(registered_email).should_not be nil
    reset_mailer
  end

  step 'a user exists with an email of :registered_email' do |registered_email|
    user = User.create(email: registered_email, password: "password")
    user.confirm!
    User.find_by_email(registered_email).should_not be nil
    reset_mailer
  end
  
  step 'I am registered and logged in as a/an :user_type' do |user_type|
    @actor = FactoryGirl.create(user_type.to_sym)
    @actor.confirm!
    login_as(@actor)
  end

  step 'I am registered, confirmed and logged in as a/an :user_type' do |user_type|
    @actor = FactoryGirl.create(user_type.to_sym).confirm!
    @actor.confirm!
    login_as(@actor)
  end

  step 'I open the password reset email' do 
    open_email(@actor.email)
  end
end
