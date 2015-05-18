Stub Env
========

[![Gem Version](https://img.shields.io/gem/v/stub_env.svg?style=flat)](http://rubygems.org/gems/stub_env)
[![Build Status](https://img.shields.io/travis/littleowllabs/stub_env/master.svg?style=flat)](https://travis-ci.org/littleowllabs/stub_env)
[![Code Climate](https://img.shields.io/codeclimate/github/littleowllabs/stub_env.svg?style=flat)](https://codeclimate.com/github/littleowllabs/stub_env)
[![Dependency Status](https://img.shields.io/gemnasium/littleowllabs/stub_env.svg?style=flat)](https://gemnasium.com/littleowllabs/stub_env)

This project provides a simple helper method to stub ENV values within RSpec tests.

To start using it, install the gem in your project in the test group.

```ruby
  gem 'stub_env'
```

Then add the following to your rails_config.rb

```ruby
RSpec.configure do |config|
  config.include StubEnv::Helpers
end
```

There are 2 possible usages. The first is to stub a single value:

```ruby
  stub_env('key', 'value')

  puts ENV['key'] # => "value"
```

These will work in series, so you can stub multiple values by making multiple calls:

```ruby
  stub_env('key1', 'value1')
  stub_env('key2', 'value2')

  puts ENV['key1'] # => "value1"
  puts ENV['key2'] # => "value2"
```

The second method is to stub multiple values using a hash:

```ruby
  stub_env({'key' => 'value', 'key2' => 'value2'})

  puts ENV['key1'] # => "value1"
  puts ENV['key2'] # => "value2"
```

You can also use this multiple times, and in combination with the other method:

```ruby
  stub_env({'key1' => 'value1', 'key2' => 'value2'})
  stub_env('key3', 'value3')
  stub_env({'key4' => 'value4'})

  puts ENV['key1'] # => "value1"
  puts ENV['key2'] # => "value2"
  puts ENV['key3'] # => "value3"
  puts ENV['key4'] # => "value4"
```

All ENV values not stubbed will return their original values.

```ruby
  # Given ENV['unstubbed_key'] = 'unstubbed_value'
  stub_env('key', 'value')

  puts ENV['key'] # => "value"
  puts ENV['unstubbed_key'] # => "unstubbed_value"

```
