require 'spec_helper'

describe "Boilerplate" do

def full_title(page_title)
  base_title = "MerciboQ!"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

  
  subject { page }
  
  describe "'Home' page" do
    
    before { visit "/" }

    it { should have_title(full_title("Home")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'About') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }    
  end

  describe "'Privacy Policy' page" do
    
    before { visit privacy_url }

    it { should have_title(full_title("Privacy Policy")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'About') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }    
  end
  
  describe "'Terms of Use' page" do
    
    before { visit terms_url }

    it { should have_title(full_title("Terms")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'About') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }    
  end
  
  describe "'Contact' page" do
    
    before { visit contact_url }

    it { should have_title(full_title("Contact")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'About') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }    
  end
  
  describe "'About' page" do
    
    before { visit about_url }

    it { should have_title(full_title("About")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }            
  end

  describe "'Help' page" do
    
    before { visit help_url }

    it { should have_title(full_title("Help")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Login') }
    it { should have_selector( 'a', text: 'Sign up') }            
  end

  describe "'Login' page" do
    
    before { visit login_url }

    it { should have_title(full_title("Login")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Sign up') }            
  end
  
  describe "'Sign up' page" do
  
    before { visit signup_url }

    it { should have_title(full_title("Sign up")) }
    it { should have_selector( 'a', text: 'MerciboQ!') }
    it { should have_selector( 'a', text: 'Privacy Policy') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Terms of Use') }
    it { should have_selector( 'a', text: 'Contact') }
    it { should have_selector( 'a', text: 'Help') }
    it { should have_selector( 'a', text: 'Home') }
    it { should have_selector( 'a', text: 'Home') }            
  end
end
