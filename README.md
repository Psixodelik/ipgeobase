# Ipgeobase

Parsing information from the ip-api site.

Available fields

- city: String
- country: String
- countryCode: String
- lat: Float
- lon: Float

Usage

```ruby
ip = Ipgeobase.lookup ('8.8.8.8')

ip.city # Montreal
```

## Installation

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase
