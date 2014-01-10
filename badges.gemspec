# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'badges/version'

Gem::Specification.new do |spec|
  spec.name          = 'badges'
  spec.version       = Badges::VERSION
  spec.authors       = ['Keil Miller Jr']
  spec.email         = ['keilmillerjr@me.com']
  spec.description   = "Badges is a Ruby gem that allows you to connect to different API's to retrieve your earned badges and profile information."
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/keilmillerjr/badges'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'
  
  spec.add_dependency 'httparty'
  spec.add_dependency 'markaby'
  
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
