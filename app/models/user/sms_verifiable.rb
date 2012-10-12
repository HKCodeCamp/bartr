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
  end
end