require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase

  test "it should redirect to login page" do
    visit "/"
    page.has_content?('Sign in')
  end

end
