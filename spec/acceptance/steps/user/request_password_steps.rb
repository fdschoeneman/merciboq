module RequestPasswordSteps

  step 'I am registered and confirmed as a :user_type' do |user_type| 
    @actor = FactoryGirl.create(user_type.to_sym)
    @actor.confirm!
    reset_mailer
  end

  step 'I should have a password reset email' do 
    email = find_email(@actor.email)
    email.subject.should eq "Reset password instructions"  
  end
end