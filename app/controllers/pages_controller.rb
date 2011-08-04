class PagesController < ApplicationController

  def home
    if signed_in?
      @title = current_user.name
    else
      @title = "Home"
    end
    @users = User.all
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

