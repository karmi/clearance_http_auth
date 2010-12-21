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
      get '/entrances.json', {}, {'HTTP_AUTHORIZATION' => encode_credentials('test@example.com', 'BADSANTA')}
      assert_equal 401, last_response.status
    end

    should "grant access when proper credentials are set" do
      get '/entrances.json', {}, {'HTTP_AUTHORIZATION' => encode_credentials('test@example.com', 'password')}
      assert_equal 200, last_response.status
      assert_match /Welcome/, last_response.body
    end

    should "not invoke HTTP authorization for incorrect format" do
      get '/entrances.santa', {}, {'HTTP_AUTHORIZATION' => encode_credentials('test@example.com', 'password')}
      assert_equal 302, last_response.status
      follow_redirect!
      assert_match /Sign in/, last_response.body
    end

  end

  private

  def encode_credentials(username, password)
    "Basic " + Base64.encode64("#{username}:#{password}")
  end

end
