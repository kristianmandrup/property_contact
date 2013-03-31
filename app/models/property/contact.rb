class Property
  module Contact
    extend ActiveSupport::Concern

    included do      
    end

    def stats user = nil
      if user && (!user.landlord? || !owned_by?(user))
        raise ArgumentError, "Property contact stats for #{self} are only accessible by landlord who owns the property #{self.owner}, not by: #{user}"
      end
      Stats.create_from self
    end
  end
end