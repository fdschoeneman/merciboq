class PagesController < ApplicationController

  def home
    @thankyou = Merciboku.new
    if signed_in?
      @title = current_user.name
    else
      @title = "Home"
    end
    @users = User.order("name").page(params[:page]).per(5)
    @recent_thankyous = Merciboku.order("created_at").page(params[:page])
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

