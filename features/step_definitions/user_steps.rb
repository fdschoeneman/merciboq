Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.new(
    :name => name,
    :email => email,
    :password => password,
    :password_confirmation => password
  ).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  step %{I have one user "#{email}" with password "#{password}"}
  step %{I go to login}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be already signed in$/ do
  step %{I should see "Logout"}
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign up page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I fill in "Password confirmation" with "#{password}"}
  step %{I press "Sign up"}
  step %{I should see "Welcome! You have signed up successfully."}
  step %{I am logout}
end

Given /^I am logout$/ do
  visit('/users/sign_out')
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

When /^I return next time$/ do
  step %{I go to the home page}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign up"}
  step %{I should see "Login"}
  step %{I should not see "Logout"}
end

Given /^I am not logged in$/ do
  visit('/users/sign_out') # :method => :delete # ensure that at least
end

