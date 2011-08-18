class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def input
    message = Mail.new params[:message]

    from = message.from[0]
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email

    message.to.each{|address|
      welcomer = User.find_or_create_by_email(address) # TODO: grab name
      Thankyou.create(:thanker => from_user, :welcomer => welcomer, :headline => message.subject, :content => message.body)
    }

 #     message.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
  end
end

