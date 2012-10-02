# require 'mail'

# FactoryGirl.define do 

#   factory :thankyou_note, class: Mail do 

#     Mail.new do
#       from "Frommy McFrommerton <frommy.mcfrommerton@unregistered.com>"
#       to "toohey.receivesalot@unregistered.com"
#       subject 'subject of an email goes to headline'
#       body 'body of an email goes to content'

#       text_part do
#         body 'Here is the attachment you wanted'
#       end

#       html_part do
#         content_type 'text/html; charset=UTF-8'
#         body '<h1>Funky Title</h1><p>Here is the attachment you wanted</p>'
#       end
#     end
#   end
# end
