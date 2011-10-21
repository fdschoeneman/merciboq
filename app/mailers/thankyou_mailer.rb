class ThankyouMailer < ActionMailer::Base
  default from: "fred@merciboq.com"

  def thankyou_notice(thankyou)
    @thankyou = thankyou
    mail(:to => thankyou.welcomer.email, :subject => "#{thankyou.thanker.name} thanked you.")
#    :thanker => thankyou.thanker.name

  end
end

