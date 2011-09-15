require 'spec_helper'

describe ThankyouByEmailController do

  message1 = "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Fred Schoeneman <fred.schoeneman@gmail.com>\r\nTo: fdschoeneman@gmail.com\r\nCc: 333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"

  message2 = "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Fred Schoeneman <fred.schoeneman@gmail.com>\r\nTo: fdschoeneman@gmail.com,lenny@aya.yale.edu\r\nCc: sweetleonster@gmail.com,thanx@merciboq.com,333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"

  message3 = "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Stanley McChrystal <stanley.mcchrystal@gmail.com>\r\nTo: subdomaintest@gmail.com, lenny.watkins@gmail.com\r\nCc: sweetleonster@gmail.com,thanx@merciboq.com,333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"

message4 = "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Stanley McChrystal <stanley.mcchrystal@gmail.com>\r\nTo: subdomaintest@gmail.com, engelbert.humperdink@gmail.com\r\nCc: sweetleonster@gmail.com,thanx@merciboq.com,333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"
  describe "POST 'create' users" do

    describe "Success" do

      it "should create 2 new users" do
        lambda do
          post :create, :message => "#{message1}"
        end.should change(User, :count).by(2)
      end

      it "should create 3 new users and ignore internal addresses" do
        lambda do
          post :create, :message => "#{message2}"
        end.should change(User, :count).by(3)
      end
    end

    describe "From: user temporary name" do

      it "should not be blank" do
        post :create, :message => "#{message1}"
        temporary_user = User.find_by_email("fred.schoeneman@gmail.com")
        temporary_user_name = temporary_user.name
        temporary_user_name.should_not be_blank
      end

      it "should be titleized" do
        post :create, :message => "#{message2}"
        temporary_user = User.find_by_email("fred.schoeneman@gmail.com")
        temporary_user_name = temporary_user.name
        temporary_user_name.should match("Fred Schoeneman")
      end
    end

    describe "From: user temporary subdomain" do

      it "should not be blank" do
        post :create, :message => "#{message3}"
        temporary_user = User.find_by_email("stanley.mcchrystal@gmail.com")
        temporary_user_subdomain = temporary_user.subdomain
        temporary_user_subdomain.should_not be_blank
      end

      it "should be legit" do
        post :create, :message => "#{message3}"
        temporary_user = User.find_by_email("stanley.mcchrystal@gmail.com")
        temporary_user_subdomain = temporary_user.subdomain
        temporary_user_subdomain.should =~ /stanley-mcchrystal/
      end
    end

    describe "To: user temporary name" do

      it "should not be blank" do
        post :create, :message => "#{message4}"
        temporary_user = User.find_by_email("engelbert.humperdink@gmail.com")
        temporary_user_name = temporary_user.name
        temporary_user_name.should_not be_blank
      end

      it "should be titleized" do
        post :create, :message => "#{message4}"
        temporary_user = User.find_by_email("engelbert.humperdink@gmail.com")
        temporary_user_name = temporary_user.name
        temporary_user_name.should match("Engelbert Humperdink")
      end
    end

    describe "From: user temporary subdomain" do

      it "should not be blank" do
        post :create, :message => "#{message4}"
        temporary_user = User.find_by_email("engelbert.humperdink@gmail.com")
        temporary_user_subdomain = temporary_user.subdomain
        temporary_user_subdomain.should_not be_blank
      end

      it "should be legit" do
        post :create, :message => "#{message4}"
        temporary_user = User.find_by_email("engelbert.humperdink@gmail.com")
        temporary_user_subdomain = temporary_user.subdomain
        temporary_user_subdomain.should =~ /engelbert-humperdink/
      end
    end

  end
end

