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


## How to use:
#### Configuration
```ruby
# config/initializers/pushbots.rb

Pushbots.configure do |config|
  config.application_id = 'Application ID'
  config.application_secret = 'Application Secret'
end
```
#### Single device notification
```ruby
# Device token
token = '900f9e35cc09ab9f3d99f0b244e23f160e0264f1aaf785549efeb6835a586710'
# platform is :ios or :android  
# (Any other value will return a RuntimeError)
platform = :ios
# Notification message
message = 'Hello World!!!'
# Build up the notification
# platform, message, token and sound (required parameters).
# options (custom fields) (optional parameter)
push = PushBot::One.new(platform, token, message, sound, options)
push.send # Delivers the notification
```

#### Multiple device notification
```ruby
# platform is an array of valid plataforms (ios or android)
# (Any other value will return a RuntimeError)
platforms = [:ios, :android]
# Notification message
message = 'Hello World!!!'
# Notification schedule (Delivery time)
schedule = DateTime.now
# Build up the notification
# platform, message, schedule (required parameters).
# options (custom fields) (optional parameter)
push = PushBot::All.new(platforms, message, schedule, options = {})
push.send # Delivers the notification
```

##### You can read Pushbots API response using:  
```ruby
# Your notification response
push.response
# Your notification response HTTP code
push.response.code
# Your notification response message
push.response.message
# Response as string
push.response.to_s
```

Read more about HTTP codes [here](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kandiie/pushbots. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
