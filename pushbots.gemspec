# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pushbots/version'

Gem::Specification.new do |spec|
  spec.name          = 'pushbots'
  spec.version       = Pushbots::VERSION
  spec.authors       = ['Carlos Omana', 'Cesar Rodriguez']
  spec.email         = ['contact@kandiie.com']
  spec.summary       = 'Ruby Wrapper for PushBots Rest API.'
  spec.description   = 'Ruby Wrapper for PushBots Rest API. '\
                       'Includes push notification methods for single and'\
                       ' multiple devices simplifying notification management '\
                       ' and pushbots api usage in your ruby projects.'
  spec.homepage      = 'https://github.com/Kandiie/pushbots'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2 or newer, required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 1.24'
  spec.add_runtime_dependency 'http', '~> 1.0', '>= 1.0.2'
end
