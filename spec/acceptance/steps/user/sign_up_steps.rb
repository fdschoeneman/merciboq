module SignUpSteps
  
  step 'I should have a confirmation email addressed to :email_addressee' do |email_addressee|
    send ":email_addressee should have an email with subject :text", email_addressee, "Confirm"
  end

  step 'no confirmation should be sent to :email_one or :email_two' do |email_one, email_two|
    send ":email_addressee should not have an email with :email_subject", email_one, "Welcome"
    send ":email_addressee should not have an email with :email_subject", email_two, "Welcome"
    end

  step 'a confirmation should be sent to :email_addressee' do |email_addressee|
    send ":email_addressee should have :count email with subject :email_subject", email_addressee, 1, "Welcome" 
  end

  step 'no user exists with an email :unregistered_email' do |unregistered_email|
    User.find_by_email(unregistered_email).should be nil
  end
  
  step 'that a user does exist with an email :registered_email' do |registered_email|
    User.create(email: registered_email)
    User.find_by_email(registered_email).should_not be nil
    reset_mailer
  end

  step 'a Merciboq from :sender to :recipient1' do |sender, recipient|
    thankyou_note
    @message.from = [sender]
    @message.to = ["thanks@merciboq.com", recipient]
    post 'thankyou_by_email/create', message: @message
  end

  step 'an account should be created for whoever :email_address belongs to' do |email|
    unregistered_sender = User.find_by_email(email)
    unregistered_sender.should_not be_nil
  end
end