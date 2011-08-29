class ThankyouByEmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new params[:message]

    from      = message.from[0]
    to        = message.to[0]
    @from_user = User.find_or_create_by_email(from)
    @to_user   = User.find_or_create_by_email(to)
    @content   = message.text_part.body.decoded
    @headline  = message.subject
    puts message.subject
#    thankyou = Thankyou.new(params[:thankyou])
    Thankyou.new(:thanker_id => @from_user.id, :welcomer_id => @to_user.id,
                 :content => @content, :headline => @headline).save( :validate => false )


    render :text => 'success', :status => 200 # 404 would reject the mail
  end
end

