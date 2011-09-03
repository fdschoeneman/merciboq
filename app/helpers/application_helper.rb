module ApplicationHelper

  def title
    base_title = "Merciboq"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end

  def you_or_user(user)
    base_pronoun = "you"
    if user == current_user
      base_pronoun
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

  def logo
    image_tag("starklogo.png", :alt => "Merciboq")
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
end

