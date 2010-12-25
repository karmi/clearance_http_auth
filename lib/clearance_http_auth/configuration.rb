module Clearance
  module HttpAuth

    # Configuration is available in your Rails' <tt>application.rb</tt> as
    # <tt>config.clearance_http_auth</tt>. See README for example.
    #
    class Configuration

      # Returns formats for which the Middleware is enabled
      #
      def self.api_formats
        @api_formats ||= %w[  json xml  ]
      end
    end

  end

end
