class Property
  module Contact
    class Requests
      def initialize contact = nil
        # configure
      end

      def received
        @received ||= 0
      end

      def replied
        @replied ||= 0
      end
    end
  end
end