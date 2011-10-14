class ThankyouMailer < ActionMailer::Base
  default from: "fred@merciboq.com"

  def thankyou_notice(thankyou)
    mail(:to => thankyou.welcomer.email, :subject => "#{thankyou.thanker.name} thanked you.")

    def thanker
      @thanker = thankyou.thanker.name
    end
  end
end

