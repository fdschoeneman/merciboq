When /^(?:|I )click "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )click the "([^"]*)" button$/ do |button|
  click_button(button)
end

Given /^(?:|I )attempt to visit the (.+)$/ do |page_name|
  visit path_to(page_name)
  response.should be_nil
end

Then /^I should be redirected to the (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

