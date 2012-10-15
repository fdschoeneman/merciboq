module SignUpSteps

  step 'there are no emails' do 
    Mail::TestMailer.deliveries.clear
  end
end