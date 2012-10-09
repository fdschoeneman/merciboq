FactoryGirl.define do

  factory :message, class: 'Mail' do
    
    from =  "Frommy McFrommerton <frommy.mcfrommerton@unregistered.com>"
    to = ["toohey.receivesalot@unregistered.com", "toohey_comrade@unregistered.com", 
      "333581f1ce6f4de6207a@cloudmailin.net", 
      "2009zinfandel@ferringtonvineyard.merciboq.com"
    ]
    cc = "like_a_boss@unregistered.com"
    subject = 'subject of an email goes to headline'
    body = 'body of an email goes to content'


    text_part {
      body 'Here is the attachment you wanted'
    }

    html_part {
      content_type 'text/html; charset=UTF-8'
      body '<h1>Funky Title</h1><p>Here is the attachment you wanted</p>'
    }
  end

  initialize_with { attributes }

end