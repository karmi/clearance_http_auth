require "rails"

module ClearanceHttpAuth

  class Engine < Rails::Engine
    config.clearance_http_auth = Configuration
  end

end
