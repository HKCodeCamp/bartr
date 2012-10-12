class User
  module SmsVerifiable
    def make_sms_verified
      self.roles << Role.sms_verified
    end

    def revoke_sms_verified
      self.roles.delete(Role.sms_verified)
    end

    def sms_verified?
      role?(:sms_verified)
    end

    # Send sms to user
    #
    # NOTE: Setup keys in config/application.yml
    # TODO use resque or delayed job
    def send_sms
      key     = Settings.twilio.key
      token   = Settings.twilio.token
      @client = Twilio::REST::Client.new key, token

      @client.account.sms.messages.create(
        :from => '+13155674679',
        :to => '+'+params[:mobile_no],
        :body => 'Activation code is xyz!'
      )
    end
  end
end