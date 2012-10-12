class SmsController < ApplicationController
  def index
  end

  def send_link
    if (params[:mobile_no])
      # TODO : refactor to config file
      
      key = "AC2073794c87e67ab60e6366873c8ef939"
      token = "68257a7cb8e0cd85bcc9960bc8bacb32"
      @client = Twilio::REST::Client.new key , token
      
      @client.account.sms.messages.create(
        :from => '+13155674679',
        :to => '+'+params[:mobile_no],
        :body => 'Activation code is xyz!'
      )
    end
    
  end

  def verify
    if (params[:pin])
      # TODO checking on the pin 
    end
  end
end
