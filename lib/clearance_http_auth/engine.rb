require "rails"

module Clearance
  module HttpAuth

    class Engine < Rails::Engine
      config.clearance_http_auth = Configuration
    end

  end

end
