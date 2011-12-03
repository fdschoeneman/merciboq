Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Given /^she is on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^she follows "([^"]*)"$/ do |link|
  click_link(link)
end

When /^she fills in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should not see a link to "([^"]*)"$/ do |arg1|
  page.should have_no_selector 'a', :text => arg1
end

Then /^I should not see a navigation link to "([^"]*)"$/ do |arg1|
  page.should have_no_selector 'a', :text => arg1
end

Then /^I should see "([^"]*)" in the title$/ do |arg2|
  page.should have_selector('title', :text => arg2)
end
Given /^I should see a link to "([^"]*)"$/ do |arg3|
  page.should have_selector 'a', :text => arg3
end

Given /^I should see a navigation link to "([^"]*)"$/ do |arg3|
  page.should have_selector 'a', :text => arg3
end

Then /^the "([^"]*)" field should be blank$/ do |field|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should be_nil
end

