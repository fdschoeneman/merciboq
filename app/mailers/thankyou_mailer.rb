class ThankyouMailer < ActionMailer::Base
  default from: "fred@merciboq.com"

  def thankyou_notice(thankyou)
    mail(:to => thankyou.welcomer.email, :subject => "Welcome to My Awesome Site")
  end
end

