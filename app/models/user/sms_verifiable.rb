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
    def send_verification_sms
      # TODO generate a verification code!
      # self.verification_code = '1234'

      User.twilio_client.account.sms.messages.create(
        :from => '+13155674679',
        :to =>   "+#{self.mobile_no}",
        :body => "Activation code is 1234!"
      )
    end

    # return a twilio client
    def self.twilio_client
      key     = Settings.twilio.key
      token   = Settings.twilio.token
      Twilio::REST::Client.new key, token
    end
  end
end