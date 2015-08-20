# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = "stub_env"
  gem.version = "1.0.4"

  gem.authors     = ["Liam Bennett"]
  gem.email       = ["liam@littleowllabs.com"]
  gem.summary     = "Stub ENV values in RSpec tests"
  gem.description = "RSpec helper for stubbing ENV values"
  gem.homepage    = "https://github.com/littleowllabs/stub_env"
  gem.license     = "MIT"

  gem.add_dependency "rspec", ">= 2.0", "< 4.0"

  gem.add_development_dependency "bundler", "~> 1.0"
  gem.add_development_dependency "rake", "~> 10.0"

  gem.files      = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(/^(spec)/)
end