# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pushbots/version'

Gem::Specification.new do |spec|
  spec.name          = 'pushbots'
  spec.version       = Pushbots::VERSION
  spec.authors       = ['Carlos Omana', 'Cesar Rodriguez']
  spec.email         = ['contact@kandiie.com']
  spec.summary       = 'A Ruby interface to the PushBots API'
  spec.description   = 'Send push notifications'
  spec.homepage      = 'https://github.com/Kandiie/pushbots'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
