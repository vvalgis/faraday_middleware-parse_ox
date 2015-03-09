# FaradayMiddleware::ParseOx

Faraday middleware for parsing response using ox. Based on faraday\_middleware-parse\_oj from 
[@7even](https://github.com/7even )

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday_middleware-parse_ox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday_middleware-parse_ox

## Usage

```ruby
require 'faraday_middleware/parse_ox'

connection = Faraday.new do |builder|
  builder.response :ox
  builder.adapter  Faraday.default_adapter
end

connection.get('http://example.com/some.xml')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/faraday_middleware-parse_ox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
