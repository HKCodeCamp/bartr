class ServiceController < ApplicationController
  def sms
    Delayed::Job.enqueue SMSJob.new('13155674679', "#{params[:mobile]}", "#{params[:message]}" )
  end

  def phone
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
end
