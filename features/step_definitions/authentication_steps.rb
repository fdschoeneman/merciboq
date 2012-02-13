When /^(?:|I )click the "Sign up" link$/ do
  click_link "Sign up"
end

Then /^"([^"]*)" should have a confirmation email$/ do |address|
  open_email(address, with_subject: "Welcome to Merciboq! -- Please confirm your account for us")
end

When /^(?:|I )follow the "([^"]*)" link$/ do |link|
  click_link(link)
end

When /^(?:|I )follow the "([^"]*)" navigation link$/ do |link|
  click_link "link"
end


And /^I am confirmed$/ do
  user = User.first
  user.confirm!
end

Then /^I empty the email queue$/ do
  reset_mailer
end

Then /^I am not signed in$/ do
  page.should have_selector('title', :text => "Merciboq | Home" )
  page.should have_selector 'a', :text => "Login"
end

Then /^I should be signed in as "([^"]*)"$/ do |arg1|
  #page.should have_selector('title', :text => "Merciboq | #{arg1}" )
  page.should have_selector 'a', :text => arg1
end

Given /^a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
 user = User.new(
                  :email => "#{email}",
                  :password => "#{password}")
  user.save
  user.confirm!
end

Given /^"([^"]*)" is confirmed and logged in with an email "([^"]*)" and a password "([^"]*)"$/ do |name, email, password|
  user = User.create!(:name => "#{name}",
                  :email => "#{email}",
                  :password => "#{password}",
                  :password_confirmation => "#{password}")
  user.confirm!
  step %{I am not logged in}
  step %{I go to the home page}
  step %{I follow the "Login" link}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Login"}
end

Given /^I am registered and logged in as "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.new(  :name => name,
                    :email => email,
                    :password => password)
  user.save!
  user.confirm!
  step %{I am not logged in}
  step %{I go to the home page}
  step %{I follow the "Login" link}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Login"}
end

Given /^a confirmed user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.new(:name => "#{name}",
                  :email => "#{email}",
                  :password => "#{password}",
                  :password_confirmation => "#{password}")
  user.save!
  user.confirm!
end


Given /^a confirmed user "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.create!(:name => "#{name}",
                  :email => "#{email}",
                  :password => "#{password}",
                  :password_confirmation => "#{password}")
  user.confirm!
  step %{I am not logged in}
  step %{I go to the home page}
  step %{I follow the "Login" link}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Login"}
end

Then /^I should see "([^"]*)" in the body$/ do |user_name|
  user_name = Regexp.new(user_name)
  page.should have_selector('a', :text => user_name)
end

Then /^I should stay on the signup page$/ do
  %{I should see "Merciboq | Sign up" in the title}
end

