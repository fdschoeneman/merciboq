require "spec_helper"

describe ThankyouMailer do
  
  describe "thankyou notifier" do 
    let(:merciboq) { create(:merciboku) } 
    let(:mail) { ThankyouMailer.thankyou_notifier(merciboq) }

    it "has the correct subject" do 
      mail.subject.should eq "#{merciboq.thanker.name} thanked you."
    end

    it "is sent to the person who has been thanked" do 
      mail.to.to_param.should eq merciboq.welcomer.email
    end

    it "is sent from the correct person at merciboq" do 
      mail.from.to_param.should eq "fred@merciboq.com"
    end

    it "has a copy of the headline embedded" do
      mail.body.to_param.should include merciboq.headline 
    end

    it "has a copy of the content embedded" do 
      mail.body.to_param.should include merciboq.content 
    end

    it "has the thanker's name embedded" do 
      mail.body.to_param.should include merciboq.thanker.name 
    end

    it "has the welcomer's name embedded" do 
      mail.body.to_param.should include merciboq.welcomer.name
    end

    it "has the welcomer's name embedded" do 
      mail.body.to_param.should include merciboq.welcomer.name
    end

    it "has the welcomer's merciboq address embedded" do 
      mail.body.to_param.should include merciboq.welcomer.subdomain
    end

    it "has the welcomer's merciboq address embedded" do 
      mail.body.to_param.should include merciboq.welcomer.subdomain
    end

  end

  describe "unrecognized merciboq address" do 
  end
end
