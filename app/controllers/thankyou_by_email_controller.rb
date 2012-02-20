class ThankyouByEmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create

    message = Mail.new params[:message]
#    Rails.logger.fatal message.inspect
#    Rails.logger.fatal message.subject #print the subject to the logs
#    Rails.logger.fatal message.body.decoded #print the decoded body to the logs
#    message.attachments.each{|attachment| Rails.logger.fatal attachment.inspect} #inspect each attachment

    from_email          = message.from[0]
    from_user = User.find_or_create_by_email(
                :email => from_email,
                :name => temporary_name(from_email),
                :subdomain => temporary_subdomain(from_email) )
    content   = (message.text_part || message.html_part).body.decoded
    headline  = message.subject

    (message.to).each do |address|
      next if internal_address? address # Goes to the next address in the array if it recognizes the email
      if address.end_with? "@*.merciboq.com"
        subdomain = address.split('@')
        subdomain[0]
        to_user = User.find_by_subdomain
      else 
        to_user = User.find_or_create_by_email(
                :email => address,
                :name => temporary_name(address),
                :subdomain => temporary_subdomain(address)
                )
      end

      thankyou = Thankyou.new(:thanker_id => from_user.id, :welcomer_id => to_user.id,
                   :content => content, :headline => headline)
      thankyou.save( :validate => false )

      ThankyouMailer.thankyou_notice(thankyou).deliver

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

    def random_subdomain_number
      random_subdomain_number = SecureRandom.random_number(10)
    end

end

