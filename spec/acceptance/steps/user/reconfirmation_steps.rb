module ReconfirmationSteps

  step 'I have an account but have not chosen a password' do 
    @actor = FactoryGirl.create(:user)
    reset_mailer
  end

  step 'I fill in my email address' do 
    send "I fill in :value for :key", @actor.email, :user_email
  end

  step 'I should have a reconfirmation email' do 
    open_email(@actor.email)
  end
end