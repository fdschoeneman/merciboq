When /^(?:|I )click the "Sign up" link$/ do
  click_link "Sign up"
end

When /^(?:|I )follow the "([^"]*)" link$/ do |link|
  click_link(link)
end

And /^I am confirmed$/ do
  user = User.first
  user.confirm!
end

Then /^I am not signed in$/ do
  page.should have_selector('title', :text => "Merciboq | Home" )
  page.should have_selector 'a', :text => "Login"
end

Then /^I should be signed in as "([^"]*)"$/ do |arg1|
  #page.should have_selector('title', :text => "Merciboq | #{arg1}" )
  page.should have_selector 'a', :text => arg1
end

