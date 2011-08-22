class ThankyouByEmailController < UsersController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    Rails.logger.log Logger::INFO, message.subject
    Rails.logger.log Logger::INFO, message.body.decoded

    from      = message.from[0]
    to        = message.to[0]
    from_user = User.find_or_create_by_email(from,
                          :password =>             "password",
                          :password_confirmation => "password")
    to_user   = User.find_or_create_by_email(to,
                          :password => "password",
                          :password_confirmation => "password")
    message.to.each do |address|
      from_user.thankyous.create!(:welcomer => to_user.id,
                                  :headline => message.subject,
                                  :content => message.body)
    end

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
end

