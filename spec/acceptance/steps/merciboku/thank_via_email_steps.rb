module ThankViaEmailSteps

	step 'a(n) email/merciboqmail from :sender to :recipient1 with subject :subject and content :content' do |sender, recipient, subject, content|
		@merciboqmail = thankyou_note
    @merciboqmail.from = sender
		@merciboqmail.to = [recipient]
    @merciboqmail.subject = subject
    @merciboqmail.body = body
	end		

  step 'an email from :sender to the merciboq address of :recipient with subject :subject and content :content' do |sender, recipient, subject, content|
    recipient = User.find_by_email(recipient)
    @merciboqmail = thankyou_note
    @merciboqmail.from = sender
    @merciboqmail.to = ["#{recipient.subdomain}@merciboq.com"]
    @merciboqmail.subject = subject
    @merciboqmail.body = body
  end

  step 'the system should have :count new user(s)' do |count| 
    expect{
        post "thankyou_by_email/create", message: @merciboqmail}.to change(User, :count).by(count.to_i)
  end

  step 'the system should have :count new merciboq(s)' do |count| 
    expect{
       post "thankyou_by_email/create", message: @merciboqmail}.to change(Merciboku, :count).by(count.to_i)
  end

  step ':user_email should have an account' do |user_email|
    User.find_by_email(user_email).should_not be_nil
  end

end