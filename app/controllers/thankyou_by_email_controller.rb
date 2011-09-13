class ThankyouByEmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new params[:message]
#    Rails.logger.fatal message.inspect
#    Rails.logger.fatal message.subject #print the subject to the logs
#    Rails.logger.fatal message.body.decoded #print the decoded body to the logs
#    message.attachments.each{|attachment| Rails.logger.fatal attachment.inspect} #inspect each attachment

    from                = message.from[0]
    from_split          = from.split('@')
    from_local          = from_split[0]
    local_spaced        = from_local.split('.').join(' ')
    from_name           = local_spaced.titleize
    local_dashed        = from_local.split('.').join('-')
    from_subdomain      = local_dashed + "-" + random_subdomain_number
    from_user = User.find_or_create_by_email(
                :email => from,
                :name => from_name,
                :subdomain => from_subdomain )
    content   = (message.text_part || message.html_part).body.decoded
    headline  = message.subject

    (message.to).each {|address|
      next if internal_address? address # Goes to the next address in the array if it recognizes the email

      to_user = User.find_or_create_by_email(address)

      thankyou = Thankyou.new(:thanker_id => from_user.id, :welcomer_id => to_user.id,
                   :content => content, :headline => headline)
      thankyou.save( :validate => false )

      message.attachments.each{|attachment|
#        Rails.logger.info attachment.inspect
        thankyou.attachments << Attachment.new(:filename => attachment.filename, :mimetype => attachment.mime_type, :bytes => attachment.body.decoded)
        # TODO: bytecount
      }
    }

#    def temporary_name(email)
#      split_email     = (email).split('@')
#      local_part      = split_email[0]
#      spaced          = local_part.split('.').join(' ')
#      temporary_name  = spaced.titleize
#    end

    render :text => 'success', :status => 200 # 404 would reject the mail
  end

  private

    def internal_address?(address)
      "333581f1ce6f4de6207a@cloudmailin.net" == address or address.end_with? "@merciboq.com"
    end

    def random_subdomain_number
      random_subdomain_number = random_number(10)
    end
end

