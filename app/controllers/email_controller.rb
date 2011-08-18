class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def input
    message = Mail.new params[:message]
logger.debug "message:\t#{message}"

    from = message.from[0]
logger.debug "from:\t#{from}"
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email
logger.debug "from_user:\t#{from_user}"

    message.to.each{|address|
logger.debug "address:\t#{address}"
      to_user = User.find_or_create_by_email(address) # TODO: grab name
logger.debug "to_user:\t#{to_user}"
      ty = Thankyou.create(:thanker => from_user, :welcomer => to_user, :headline => message.subject, :content => message.body)
logger.debug "from:\t#{from}"
logger.debug "ty:\t#{ty}"
    }

 #     message.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
  end
end

