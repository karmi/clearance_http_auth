require 'clearance_http_auth/configuration'
require 'clearance_http_auth/middleware'
require 'clearance_http_auth/current_user_override'
require 'clearance_http_auth/engine'

module Clearance

  # Include this module in a controller to enable the middleware and +current_user+ override:
  #
  #     class ProjectsController < ApplicationController
  #       include Clearance::Authentication
  #       include Clearance::HttpAuth
  #     end
  #
  module HttpAuth
    def self.included(controller)
      controller.send :include, CurrentUserOverride
      controller.use  Middleware
    end
  end
end
