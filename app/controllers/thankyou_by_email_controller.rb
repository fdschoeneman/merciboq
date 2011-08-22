class ThankyouByEmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    Rails.logger.log Logger::INFO, message.subject
    Rails.logger.log Logger::INFO, message.body.decoded

    from      = message.from[0]
    to        = message.to[0]
    from_user = User.find_or_create_by_email(from,
                          :password =>             "password",
                          :password_confirmatin => "password")
#    to_user   = User.find_or_create_by_email(to)
    message.to.each{|address|
    to_user = User.find_or_create_by_email(to) # TODO: grab name
    Thankyou.create!(:thanker => from_user.id, :welcomer => to_user.id, :headline => message.subject, :content => message.body)
    }


    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
end

