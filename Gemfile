source 'https://rubygems.org'

# Specify your gem's dependencies in knife-role-test.gemspec
gemspec

group :test do
  gem 'rake', '~> 0.9'

  # allow CI to override the version of Chef for matrix testing
  gem 'chef', (ENV['CHEF_VERSION'] || '>= 11.8.2')
end
