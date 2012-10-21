module SignUpSteps
  
  step 'I should have a confirmation email addressed to :email_addressee' do |email_addressee|
    email = Mail::TestMailer.deliveries.last
    email.to.to_param.should eq email_addressee
    email.subject.should eq "Welcome to MerciboQ! -- Please confirm your account for us."
  end

  step 'I follow the :link_name link in the email' do |link_name| 
    visit_in_email(link_name)
  end

  step 'an email to Merciboq from an unregistered user to an unregistered user' do
    thankyou_note
    post 'thankyou_by_email/create', message: thankyou_note
  end

  step 'an email to Merciboq from a registered user to an unregistered user' do 
    thankyou_note
    User.create(email: "registered@sender.com")
    thankyou_note.from = "registered@sender.com"
  end

  step 'an account should be created for the unregistered sender' do 
    unregistered_sender = User.find_by_email("frommy.mcfrommerton@unregistered.com")
    unregistered_sender.should_not be_nil
  end

end