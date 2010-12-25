require 'rails'

module Clearance
  module HttpAuth

    class Engine < Rails::Engine
      # Expose Clearance::HttpAuth::Configuration in the <tt>application.rb</tt>
      config.clearance_http_auth = Configuration
    end

  end

end
