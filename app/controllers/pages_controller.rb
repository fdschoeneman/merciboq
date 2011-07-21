class PagesController < ApplicationController

  def home
    @title = "Home"
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

