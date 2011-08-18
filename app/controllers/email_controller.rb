class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def create
    params[:user][:password]              = "password"
    params[:user][:password_confirmation] = "password"
  end

  def input
    message = Mail.new params[:message]
logger.fatal "message:\t#{message}"

    from = message.from[0]
logger.fatal "from:\t#{from}"
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email
logger.fatal "from_user:\t#{from_user}"

    message.to.each{|address|
logger.fatal "address:\t#{address}"
      to_user = User.find_or_create_by_email(address) # TODO: grab name
logger.fatal "to_user:\t#{to_user}"
      ty = Thankyou.create!(:thanker => from_user, :welcomer => to_user, :headline => message.subject, :content => message.body)
logger.fatal "from:\t#{from}"
logger.fatal "ty:\t#{ty}"
    }

 #     message.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
  end
end

