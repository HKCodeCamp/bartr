class SmsController < ApplicationController
  def index
  end

  def send_link
    if (params[:mobile_no])
      # See models/user/sms_verifiable.rb
      
    end
    
  end

  def verify
    if (params[:pin])
      # TODO checking on the pin 
    end
  end
end
