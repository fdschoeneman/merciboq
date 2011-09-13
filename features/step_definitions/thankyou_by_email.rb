When /^a thankyou email is sent from one unregistered user to another$/ do
 from_email = "customer@test.com"
  from_name = "Custardy Customer"
  to_email = "hairstylist@test.com"
  to_name = "Harry Hairstylist"

  post 'thankyou_by_email/create', :message => "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: #{from_name} <#{from_email}>\r\nTo: #{to_name}<#{to_email}>\r\nCc: 333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"
end

Then /^the thanker should have a confirmation email$/ do
  And %{"customer@test.com" should have 1 email}
end

Then /^the welcomer should have a confirmation email$/ do
  And %{"hairstylist@test.com" should have 1 email}
end

Then /^the thanker opens her email$/ do
  open_email("customer@test.com")
end

Then /^she should see "Confirmation instructions" in the subject$/ do
  current_email.should have_subject("Confirmation instructions")
end

Then /^she should see "([^"]*)" in the email body$/ do |arg1|
  current_email.default_part_body.to_s.should include(arg1)
end

When /^she follows the confirmation in the email body$/ do
  click_first_link_in_email
end

Then /^she should see "([^"]*)" in the title$/ do |arg1|
  %{I should see "Merciboq | #{arg1}" in the title}
end

Then /^when she fills in her password and confirmation$/ do
  fill_in("Password", :with => "password")
  fill_in("Password confirmation", :with => "password")
end

Then /^she presses "([^"]*)"$/ do |arg1|
  click_button("#{arg1}")
end

Then /^she should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

