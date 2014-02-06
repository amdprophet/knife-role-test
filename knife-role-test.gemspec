# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife_role_test/version'
require 'knife_role_test/helpers'

Gem::Specification.new do |spec|
  spec.name          = "knife-role-test"
  spec.version       = KnifeRoleTest::VERSION
  spec.authors       = ["Justin Kolberg"]
  spec.email         = ["amd.prophet@gmail.com"]
  spec.summary       = %q{A Chef knife plugin to validate roles}
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/amdprophet/knife-role-test"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.0"
end
