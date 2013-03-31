class Property
  module Contact
    class Stats
      attr_accessor :max_requests_allowed, :visits

      def initialize options = {}
        @max_requests_allowed = options[:max_requests_allowed] || default_max_requests_allowed
      end

      def self.create_from property
        self.new max_requests_allowed: property.max_requests_allowed
      end

      def requests
        @requests ||= Property::Contact::Requests.new
      end

      protected

      def default_max_requests_allowed
        50
      end
    end
  end
end