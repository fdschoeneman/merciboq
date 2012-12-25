module ApplicationHelper

  def title
    base_title = "MerciboQ!"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end

  def logo
    base_logo = "MerciboQ!"
    if @subdomain_logo.nil?
      base_logo
    else
      "#{@subdomain_logo}.merciboq.com"
    end
  end
  
  def email_instructions
    email_instructions = "Replace_this_email_with_that_of_the_person_you_wish_to_appreciate"
  end

  def merciboq_mail_to(user)
    subject_suggestion = "Replace this text with a catchy headline"
    body_suggestion = "What did this person do that you would like to recognize? What you write here will be published as soon as you hit send"
    mail_to("#{user.subdomain}@merciboq.com", 
      name="#{@user.subdomain}@merciboq.com", 
      html_options = {  subject: subject_suggestion,
                        body: body_suggestion, 
                        :encode=> "hex" })
  end

  def current_user_or_user(user)
    base_pronoun = "you"
    if user == current_user
      base_pronoun
    else
      user.name
    end
  end

  def you_or_user(user)
    base_pronoun = "you"
    if user == current_user
      if current_user.name.empty?
        "this user"
      else
        base_pronoun
      end
    else
      "this user"
    end
  end

  def has_or_have(user)
    if user == current_user
      "have"
    else
      "has"
    end
  end

  def logo_image
    image_tag("redlogo.png", :alt => "Merciboq")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def welcomer
    welcomer = thankyou.welcomer_id
  end
  
  def twitterized_type(type)
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
#      else
#        type.to_s
  end
end

end

