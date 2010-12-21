class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include ClearanceHttpAuth
  protect_from_forgery
end
