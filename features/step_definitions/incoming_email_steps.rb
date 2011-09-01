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

Given /^(?:|I )am unregistered and thank another unregistered user$/ do
  visit "/thankyou_by_email/create", :post, :params => "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Fred Schoeneman <fred.schoeneman@gmail.com>\r\nTo: fdschoeneman@gmail.com\r\nCc: 333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"
end

def look_for_email_subject(subject)
  with_scope(nil) do
    page.has_link?(subject)
  end
end

