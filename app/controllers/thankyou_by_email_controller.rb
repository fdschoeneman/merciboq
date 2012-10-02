class ThankyouByEmailController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  require 'mail'

  def create

    message = Mail.new params[:message]

    message_sender_address = message.from.first
    message_recipient_addresses = message.to

    from_user = User.find_or_create_by_email(message_sender_address)
    content   = (message.text_part || message.html_part).body.decoded
    headline  = message.subject

    message_recipient_addresses.each do |address|
      
      next if internal_address?(address)

      if merciboq_subdomain?(address)
        subdomain = address.split('@').second.split('.merciboq.com')
        to_user = User.find_by_subdomain(subdomain)
        next if to_user.nil?
      else 
        to_user = User.find_or_create_by_email(address)
      end

      thankyou = Merciboku.new(:thanker_id => from_user.id, :welcomer_id => to_user.id,
                   :content => content, :headline => headline)
      thankyou.save( :validate => false )

      ThankyouMailer.thankyou_notifier(thankyou).deliver

      message.attachments.each{|attachment|
#        Rails.logger.info attachment.inspect
        thankyou.attachments << Attachment.new(:filename => attachment.filename, :mimetype => attachment.mime_type, :bytes => attachment.body.decoded)
        # TODO: bytecount
      }
    end

    render :text => 'success', :status => 200 # 404 would reject the mail
  end

  private

  def internal_address?(address)
    "333581f1ce6f4de6207a@cloudmailin.net" == address or address.end_with? "@merciboq.com"
  end

  def merciboq_subdomain?(address)
    address.end_with? ".merciboq.com"
  end
end

