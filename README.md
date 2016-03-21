# Pushbots

Ruby Wrapper for PushBots Rest API made with love by Kandiie

PushBots is a Light SDK for mobile push notifications and now you can use
this gem on your favorite Ruby on Rails Projects.

## Table of Contents
- [Installation](#installation)
- [Configuration](#configuration)

- [How to use](#how-to-use)
  - [Device management](#device-management)
    - [Register a device](#register-a-device)
    - [Delete a device](#delete-a-device)
    - [Device information](#device-information)

  - [Notifications](#notifications)
    - [Single device notification](#single-device-notification)
    - [Multiple device notifications](#multiple-device-notification)
    - [Read pushbots response](#read-pushbots-response)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pushbots'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pushbots

## Configuration
```ruby
# config/initializers/pushbots.rb

Pushbots.configure do |config|
  config.application_id = 'Application ID'
  config.application_secret = 'Application Secret'
end
```

# How to use:
## Device management
#### Register a device
```ruby
# token and platform are required to add a device
device = Pushbots::Device.new(token, platform)
# register the device to pushbots returns true/false
# an attempt to register a device
# that has been already registered returns false
device.register
```

#### Delete a device
```ruby
# token and platform are required to delete a device
device = Pushbots::Device.new(token, platform)
# remove the device from pushbots
# returns true if no errors occurred
device.delete
```

#### Device information
```ruby
# token is required to get device information
# platform is an optional parameter
device = Pushbots::Device.new(token)
# Get device information
device.info
# Device token
device.token
# Device status
device.platform
# Device tags
device.tags
```

## Notifications
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
push = PushBots::One.new(platform, token, message, sound, options)
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
push = PushBots::All.new(platforms, message, schedule, options = {})
push.send # Delivers the notification
```

##### Read pushbots response
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
