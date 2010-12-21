# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "clearance_http_auth/version"

Gem::Specification.new do |s|
  s.name          = "clearance_http_auth"
  s.version       = ClearanceHttpAuth::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = "HTTP Basic Authentication for Clearance"
  s.homepage      = "http://github.com/karmi/clearance_http_auth"
  s.authors       = [ 'Karel Minarik' ]
  s.email         = 'karmi@karmi.cz'

  s.files         = %w( README.rdoc Rakefile MIT-LICENSE )
  s.files        += Dir.glob("lib/**/*")
  s.files        += Dir.glob("test/**/*")
  s.files        += Dir.glob("examples/**/*")

  s.require_path  = 'lib'

  s.extra_rdoc_files  = [ "README.rdoc", "LICENSE" ]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "bundler",   "~> 1.0.0"
  s.add_dependency "clearance", ">  0.9"
  s.add_dependency "rack",      ">  1.2"

  s.add_development_dependency "thin"
  s.add_development_dependency "turn"
  s.add_development_dependency "shoulda"

  s.description = <<-DESC
   Simple, instant HTTP Basic Authentication for applications
   using Clearance [https://github.com/thoughtbot/clearance].
  DESC
end