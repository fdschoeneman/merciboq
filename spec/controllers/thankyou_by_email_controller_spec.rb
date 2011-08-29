require 'spec_helper'

describe ThankyouByEmailController do
  render_views

  describe "POST 'create'" do

    describe "success" do

      before(:each) do
#        @attr = {
#	        :to=>"<333581f1ce6f4de6207a@cloudmailin.net>",
#	        :from=>"@gmail.com",
#	        :subject=>"cucumber test",
#	        :plain=>"small body email",
#	        :html=>"small body email"
#        }
      end

      it "should create 2 new users" do
        lambda do
          post :create, :message => "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Fred Schoeneman <fred.schoeneman@gmail.com>\r\nTo: fdschoeneman@gmail.com\r\nCc: 333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"
        end.should change(User, :count).by(2)
      end

      it "should create 4 new users and ignore internal addresses" do
        lambda do
          post :create, :message => "Received: by gyf3 with SMTP id 3so3470151gyf.3\r\n        for <333581f1ce6f4de6207a@cloudmailin.net>; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=gamma;\r\n        h=mime-version:date:message-id:subject:from:to:cc:content-type;\r\n        bh=bVAtsBLcd+JHZJ78Mnk6VgJm8TegFWKcRc0OsCZRIsA=;\r\n        b=IEWpW68f8OXq0UMR/Bjaifljx9RQcZUf2u4qeuzZW9RwNv7jQijFihXRzg359Xr1yh\r\n         8eyntN4ux1mkoE6bunb2iw3cUPFycRX2M84w8+P6tcztEvoaEoTaAMqOE2H0GfRKsT0F\r\n         lBL06WLq2dvcvKV4YIV0CEoL97vGvGzXH/ZHc=\r\nMIME-Version: 1.0\r\nReceived: by 10.42.73.201 with SMTP id t9mr2687407icj.11.1314469918695; Sat,\r\n 27 Aug 2011 11:31:58 -0700 (PDT)\r\nReceived: by 10.42.220.6 with HTTP; Sat, 27 Aug 2011 11:31:58 -0700 (PDT)\r\nDate: Sat, 27 Aug 2011 11:31:58 -0700\r\nMessage-ID: <CAE+RemzROirPsAtJ=8VUMK5tg3cg7VPgb7sh=BHi=xdzuCC5QA@mail.gmail.com>\r\nSubject: cucumber test\r\nFrom: Fred Schoeneman <fred.schoeneman@gmail.com>\r\nTo: fdschoeneman@gmail.com,lenny@aya.yale.edu\r\nCc: sweetleonster@gmail.com,thanx@merciboq.com,333581f1ce6f4de6207a@cloudmailin.net\r\nContent-Type: multipart/alternative; boundary=90e6ba6e872292602c04ab80e060\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060\r\nContent-Type: text/html; charset=ISO-8859-1\r\n\r\nsmall body email\r\n\r\n--90e6ba6e872292602c04ab80e060--\r\n"
        end.should change(User, :count).by(4)
      end

    end

  end

end

