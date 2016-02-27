# Pushbots

A Ruby interface to the PushBots API made with love by Kandiie

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pushbots'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pushbots

## Usage

#### Configuration
```ruby
# config/initializers/pushbots.rb

Pushbots.configure do |config|
  config.application_id = 'Application ID'
  config.application_secret = 'Application Secret'
end
```
#### Push a notification to a token
```ruby
# platform is :ios or :android
token = '900f9e35cc09ab9f3d99f0b244e23f160e0264f1aaf785549efeb6835a586710'
platform = :ios
message = 'Hello World!!!'
push = PushBot::Push.new(token, platform, message)
push.deliver
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kandiie/pushbots. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

