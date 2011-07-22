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

