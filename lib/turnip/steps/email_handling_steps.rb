module EmailHandlingSteps

  step 'there are no emails' do 
    Mail::TestMailer.deliveries.clear 
  end

  step 'I open the email to :email_addressee' do |email_addressee|
    open_email(email_addressee)
  end
end