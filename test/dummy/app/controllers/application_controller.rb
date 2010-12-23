class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include Clearance::HttpAuth
  protect_from_forgery
end
