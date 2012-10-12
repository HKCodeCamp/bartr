class User
  module Adminable  
    def make_admin
      self.roles << Role.admin
    end

    def revoke_admin
      self.roles.delete(Role.admin)
    end

    def admin?
      role?(:admin)
    end
  end
end