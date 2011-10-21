class ThankyouMailer < ActionMailer::Base
  default from: "fred@merciboq.com"

  def thankyou_notice(thankyou)
    @thankyou = thankyou
    mail(:to => thankyou.welcomer.email, :subject => "#{thankyou.thanker.name} thanked you.")
#    :thanker => thankyou.thanker.name

  end

  def thanker(thankyou)
    @thanker = thankyou.thanker.name
  end

  def welcomer(thankyou)
    @welcomer = thankyou.welcomer.name
  end

  def headline(thankyou)
    @headline = thankyou.headline
  end

  def content(thankyou)
    @content = thankyo.content
  end

end

