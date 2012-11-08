module ThankViaEmailSteps

	step 'a merciboqmail from a :sender to a :recipient' do |sender, recipient|
		thankyou_note
		thankyou_note.from = sender
		thankyou_note.to = recipient 
		post :create, message: thankyou_note
		User.count.should eq 2
	end		

end