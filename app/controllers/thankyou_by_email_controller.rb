class ThankyouByEmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new params[:message]
    Rails.logger.log message.inspect
#    Rails.logger.log message.subject #print the subject to the logs
  #    Rails.logger.log message.body.decoded #print the decoded body to the logs
#    message.attachments.all.each{|attachments| Rails.logger.log attachment.inspect} #inspect each attachment


    from      = message.from[0]
    from_user = User.find_or_create_by_email(from)
    content   = message.text_part.body.decoded
    headline  = message.subject

    (message.to).each {|address|
      next if internal_address? address # Goes to the next address in the array if it recognizes the email

      to_user = User.find_or_create_by_email(address)

      Thankyou.new(:thanker_id => from_user.id, :welcomer_id => to_user.id,
                   :content => content, :headline => headline).save( :validate => false )
      }

    render :text => 'success', :status => 200 # 404 would reject the mail
  end

  private
    def internal_address?(address)
      "333581f1ce6f4de6207a@cloudmailin.net" == address or address.end_with? "@merciboq.com"
    end
end

