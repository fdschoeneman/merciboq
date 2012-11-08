module UtilitySteps 

  step 'I am on the home page' do
    visit root_url
  end

  step 'I am on the :path path' do |path|
    visit "/#{path}"
  end

  step 'show me the page' do 
    save_and_open_page
  end

  step 'show me the email' do 
    EmailSpec::EmailViewer::save_and_open_email(Mail::TestMailer.deliveries.last)
  end

  step 'I follow the :link link' do |link|
    click_link(link)
  end

  step 'I fill in :value for :key' do |value, key|
    fill_in key, with: value
  end

  step 'I fill in :key with :value' do |key, value|
    fill_in key, with: value
  end

  step 'I press :button' do |button|
    click_button(button)
  end

  step 'I should see a notice with :text' do |text|
    page.should have_content(text)
  end

  step 'I should see an error notice with :text' do |text|
    page.should have_content(text)
  end
end