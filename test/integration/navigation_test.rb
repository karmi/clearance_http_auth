require 'test_helper'
require 'dummy/test/factories/clearance'

class NavigationTest < ActiveSupport::IntegrationCase

  setup do
    Factory.create(:email_confirmed_user,
                   :email => 'test@example.com',
                   :password => 'password')
  end

  context "When navigating the application, it" do

    should "display login form" do
      visit "/"
      page.has_content?('Sign in')
    end

    should "grant access with proper credentials" do
      visit   "/"
      fill_in 'Email',    :with => 'test@example.com'
      fill_in 'Password', :with => 'password'
      click_link_or_button "Sign in"
      assert  page.has_content?('Welcome!'), "does not display content"
    end

    should "deny access with wrong credentials" do
      visit    "/"
      fill_in  'Email',    :with => 'test@example.com'
      fill_in  'Password', :with => 'BADSANTA'
      click_link_or_button "Sign in"
      assert ! page.has_content?('Welcome!'), "displays protected content"
      assert   page.has_content?('Sign in'),  "does not display login form"
    end

  end

end
