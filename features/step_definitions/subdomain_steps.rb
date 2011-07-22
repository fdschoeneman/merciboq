And /^I am on the subdomain for (.+)$/ do |sub|
  host! "#{sub}.#{TEST_DOMAIN}"  #TEST_DOMAIN is defined in test.rb.  In my case TEST_DOMAIN = 'example.com'
end
