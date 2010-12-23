require 'test_helper'

class Clearance::HttpAuthTest < ActiveSupport::TestCase

  context "Configuration" do
    should "return JSON and XML formats by default" do
      assert Clearance::HttpAuth::Configuration.api_formats.include?('json'), "does not include JSON"
      assert Clearance::HttpAuth::Configuration.api_formats.include?('xml'),  "does not include XML"
    end

    should "allow adding formats" do
      assert_nothing_raised { Clearance::HttpAuth::Configuration.api_formats << 'pdf' }
      assert Clearance::HttpAuth::Configuration.api_formats.include?('pdf'), "does not include added format"
    end
  end

end
