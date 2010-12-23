require 'clearance_http_auth/configuration'
require 'clearance_http_auth/middleware'
require 'clearance_http_auth/current_user_override'
require 'clearance_http_auth/engine'

module Clearance
  module HttpAuth
    def self.included(controller) # :nodoc:
      controller.send :include, CurrentUserOverride
      controller.use  Middleware
    end
  end
end
