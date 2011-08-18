class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def input
    message = Mail.new params[:message]
logger.debug "message:\t#{message}"

    from = message.from[0]
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email


    message.to.each{|address|
      to_user = User.find_or_create_by_email(address) # TODO: grab name
      Thankyou.create(:thanker => from_user, :welcomer => to_user, :headline => message.subject, :content => message.body)
    }

 #     message.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
  end
end

