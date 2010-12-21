require 'test_helper'
require 'dummy/test/factories/clearance'

class NavigationTest < ActiveSupport::IntegrationCase

  context "When navigating the application, and" do

    setup do
      user = Factory(:user, :email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
      user.email_confirmed = true
      user.save!
    end

    context "not signed in, it" do

      should "redirect to login page" do
        visit "/"
        page.has_content?('Sign in')
      end

      should "grant access with proper credentials" do
        p User.all
        visit   "/"
        fill_in 'Email',    :with => 'test@example.com'
        fill_in 'Password', :with => 'password'
        click   "Sign in"
        assert  page.has_content?('Welcome!'), "displays protected content"
      end

      should "deny access with wrong credentials" do
        visit    "/"
        fill_in  'Email',    :with => 'test@example.com'
        fill_in  'Password', :with => 'BADSANTA'
        click    "Sign in"
        assert ! page.has_content?('Welcome!'), "displays protected content"
        assert   page.has_content?('Sign in'),  "does not display login form"
      end

    end


  end

end
