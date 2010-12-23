require 'test_helper'

class ClearanceHttpAuthTest < ActiveSupport::TestCase

  context "Configuration" do
    should "return JSON and XML formats by default" do
      assert ClearanceHttpAuth::Configuration.api_formats.include?('json'), "does not include JSON"
      assert ClearanceHttpAuth::Configuration.api_formats.include?('xml'),  "does not include XML"
    end

    should "allow adding formats" do
      assert_nothing_raised { ClearanceHttpAuth::Configuration.api_formats << 'pdf' }
      assert ClearanceHttpAuth::Configuration.api_formats.include?('pdf'), "does not include added format"
    end
  end

end
