class ServiceController < ApplicationController
  def sms
    Delayed::Job.enqueue SMSJob.new('13155674679', "#{params[:mobile]}", "#{params[:message]}" )
  end

  def phone
    Delayed::Job.enqueue PhoneJob.new('13155674679', "#{params[:mobile]}", "#{params[:url]}" )
  end
  
  def respond_twiml
    response = Twilio::TwiML::Response.new do |r|
      # r.Say 'hello there', :voice => 'woman'
      r.Play "http://www.igpsd.com/ecq/20121025114849-226032344.mp3"
    end

    # print the result
    render :xml => response.text
  end
  
  
  
  class SMSJob < Struct.new(:from, :to, :message)
    def perform
      key     = Settings.twilio.key
      token   = Settings.twilio.token
      
      Twilio::REST::Client.new( key, token).account.sms.messages.create(
        :from => "+#{from}",
        :to =>   "+#{to}",
        :body => "#{message}"
      )
    end
  end
  
  class PhoneJob < Struct.new(:from, :to, :url)
    def perform
      key     = Settings.twilio.key
      token   = Settings.twilio.token
      
      Twilio::REST::Client.new( key, token).account.calls.create(
        :from => "+#{from}",
        :to =>   "+#{to}",
        :url => "#{url}"
      )
    end
  end
end
