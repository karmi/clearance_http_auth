require 'test_helper'
require 'dummy/test/factories/clearance'

class APITest < ActiveSupport::TestCase

  include Rack::Test::Methods

  def app
    Dummy::Application
  end

  def setup
    Factory.create(:email_confirmed_user,
                   :email => 'test@example.com',
                   :password => 'password',
                   :password_confirmation => 'password')
  end

  context "When navigating the API, it" do

    should "deny access when no credentials are set" do
      get '/entrances.json'
      assert_equal 401, last_response.status
    end

    should "deny access when bad credentials are set" do
      authorize 'test@example.com', 'BADSANTA'
      get '/entrances.json'
      assert_equal 401, last_response.status
    end

    should "grant access when proper credentials are set" do
      authorize 'test@example.com', 'password'
      get '/entrances.json'
      assert_equal 200, last_response.status
      assert_match /Welcome/, last_response.body
    end

    should "not invoke HTTP authorization for incorrect format" do
      authorize 'test@example.com', 'password'
      get '/entrances.santa'
      assert_equal 302, last_response.status
      follow_redirect!
      assert_match /Sign in/, last_response.body
    end

  end

end
