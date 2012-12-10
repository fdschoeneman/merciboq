class ThankyouByEmailController < ApplicationController
  
  require 'mail'

  skip_before_filter :verify_authenticity_token

  def create

    parse_message(params[:message])

    @recipients.each do |address|
      debugger
      next if internal_address?(address)
      find_welcomer(address) 
      next if @welcomer.nil?
      create_merciboq 
      notify_welcomer

      @message.attachments.each do |attachment|
        @merciboq.attachments << Attachment.new(filename: attachment.filename, 
          mimetype: attachment.mime_type, bytes: attachment.body.decoded)
        # TODO: bytecount
      end
    end

    render :text => 'success', :status => 200 # 404 would reject the mail
  end

  def find_user_by_merciboq_address(address)
    subdomain = address.split('@').second.split('.merciboq.com')
    @user = User.find_by_subdomain(subdomain) unless @user.nil?
  end

  def find_welcomer(address)
    if merciboq_subdomain?(address)
      find_user_by_merciboq_address(address)
      @welcomer = @user
    else 
      @welcomer = User.find_or_create_by_email(address)
    end
  end

  def create_merciboq
    @merciboq = Merciboku.create(thanker_id: @thanker.id, welcomer_id: @welcomer.id, 
      content: @content, headline: @headline, validate: false)
  end

  def notify_welcomer
    ThankyouMailer.thankyou_notifier(@merciboq).deliver
  end

private

  def parse_message(message_params)
    @message    = Mail.new(message_params)
    @recipients = @message.to
    @thanker    = User.find_or_create_by_email(@message.from.first)
    @headline   = @message.subject
    @content    = (@message.text_part || @message.html_part).body.decoded
  end

  def internal_address?(address)
    "333581f1ce6f4de6207a@cloudmailin.net" == address or address.end_with? "@merciboq.com"
  end

  def merciboq_subdomain?(address)
    address.end_with? ".merciboq.com"
  end
end

