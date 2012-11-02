module EmailHandlingSteps

  step 'there are no emails' do 
    reset_mailer
  end

  step 'I follow the :link_name link in the email' do |link_name| 
    visit_in_email(link_name)
  end

  step ':email_addressee should not have an email with :email_subject' do |email_addressee, email_subject|
    find_email(email_addressee, with_subject: email_subject).should be nil
  end

  step ':email_addressee should have :count email with subject :email_subject' do |email_addressee, count, email_subject|
    unread_emails_for(email_addressee).select { |m| 
      m.subject =~ Regexp.new(Regexp.escape(email_subject)) 
      }.size.should == parse_email_count(count)
  end

  step ':email_addressee should have an email' do |email_addressee|
    email = find_email(email_addressee)
    email.subject.should eq "Welcome to MerciboQ! -- Please confirm your account for us."
  end

  step 'I open the email to :email_addressee' do |email_addressee|
    open_email(email_addressee)
  end
end