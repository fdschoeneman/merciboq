class ThankyouNotifier < ActionMailer::Base
  default from: "fred@merciboq.com"

  def thanked(thankyou)
    mail(:to => thankyou.welcomer.email,
         :subject => "Someone thinks you're awesome",
         :body => "")

  end

end

