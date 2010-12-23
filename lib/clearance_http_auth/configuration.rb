module Clearance
  module HttpAuth

    class Configuration
      def self.api_formats
        @api_formats ||= %w[  json xml  ]
      end
    end

  end

end
