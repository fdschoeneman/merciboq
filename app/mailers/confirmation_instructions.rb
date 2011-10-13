class ConfirmationsMailer < ActionMailer::Base
  default from: "fred@merciboq.com"

  def confirmation_instructions(user)
    mail(:to => user.email, :subject => "Getsome!")
  end
end

