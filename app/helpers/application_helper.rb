module ApplicationHelper

  def title
    base_title = "Merciboq"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end

  def logo
    image_tag("apple-touch-icon.png", :alt => "Merciboq", :class => "round")
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

