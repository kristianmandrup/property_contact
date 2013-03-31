class User
  module Account
    class Landlord
      include Mongoid::Document

      embedded_in :user, class_name: 'User', inverse_of: :landlord_account
      has_one :property, class_name: 'Property', inverse_of: :owner

      def landlord
        self
      end

      def landlord?
        true
      end      
    end

    class Tenant
      include Mongoid::Document

      embedded_in :user, class_name: 'User', inverse_of: :tenant_account

      def landlord?
        false
      end            
    end
  end
end