class PagesController < ApplicationController

  def home
    if signed_in?
      @title = current_user.name
    else
      @title = "Home"
    end
    @users = User.order("name").page(params[:page]).per(5)
    @recent_thankyous = Thankyou.order("created_at").page(params[:page]).per(5)
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def terms
    @title = "Terms of Use"
  end

  def privacy
    @title = "Privacy Policy"
  end

  def help
    @title = "Help"
  end

  def test
    @title = "Test"
  end

end

