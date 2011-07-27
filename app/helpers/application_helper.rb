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

end

