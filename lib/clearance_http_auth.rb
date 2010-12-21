require 'clearance_http_auth/middleware'
require 'clearance_http_auth/current_user_override'

module ClearanceHttpAuth

  def self.included(controller) # :nodoc:
    controller.send :include, CurrentUserOverride
    controller.use  Middleware
  end

end
