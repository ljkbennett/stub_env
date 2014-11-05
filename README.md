Stub Env
========

[![Gem Version](https://img.shields.io/gem/v/stub_env.svg?style=flat)](http://rubygems.org/gems/stub_env)
[![Build Status](https://img.shields.io/travis/littleowllabs/stub_env/master.svg?style=flat)](https://travis-ci.org/littleowllabs/stub_env)
[![Code Climate](https://img.shields.io/codeclimate/github/littleowllabs/stub_env.svg?style=flat)](https://codeclimate.com/github/littleowllabs/stub_env)
[![Dependency Status](https://img.shields.io/gemnasium/littleowllabs/stub_env.svg?style=flat)](https://gemnasium.com/littleowllabs/stub_env)

This project provides a simple helper method to stub ENV values within RSpec tests.

To start using it, install the gem in your project in the test group.

```
  gem 'stub_env'
```

Then add the following to your rails_config.rb

```
RSpec.configure do |config|
  config.include StubEnv::Helpers
end
```

Then in your examples use:

```
  stub_env('key', 'value')
```

All ENV values not stubbed will return their original values.