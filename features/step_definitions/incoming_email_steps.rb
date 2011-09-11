Given /^(?:|I )login to gmail with username "([^\"]*)" and password "([^\"]*)"$/ do |username,password|
  Capybara.app_host = 'http://www.google.com'
  visit('/a/merciboq.com')
  fill_in('Email', :with => username)
  fill_in('Passwd', :with => password)
  click_button('Sign in')
  click_link('Email')
end

Given /^(?:|I )open email message with subject "([^\"]*)"$/ do |subject|
  # sometimes the email is not their right away so refresh the inbox for up to 30 seconds
  30.times do
    break if look_for_email_subject(subject)
    sleep(1)
    click_link('Inbox')
  end
  click_link(subject)
end

Given /^(?:|I )should see in email message "([^\"]*)"$/ do |regexp|
  regexp = Regexp.new(regexp)
  with_scope("table/tbody/tr[4]/td/div[@class='msg']") do
    if page.respond_to? :should
     page.should have_xpath('//*', :text => regexp)
    else
     assert page.has_xpath?('//*', :text => regexp)
    end
  end
end

Given /^(?:|I )follow link "([^"]*)" in email message$/ do |field|
  with_scope("table/tbody/tr[4]/td/div[@class='msg']") do
    visit(field)
  end
end

Given /^(?:|I )clear my inbox$/ do
  Capybara.app_host = 'http://www.google.com'
  visit('/a/quickleft.com')
  click_link('Email')
  with_scope(nil) do
    page.all(:xpath, "//input[@type='checkbox']").each do |checkbox|
      checkbox.set(true)
    end
  end
  click_button('Delete')
end

def look_for_email_subject(subject)
  with_scope(nil) do
    page.has_link?(subject)
  end
end

