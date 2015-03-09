# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday_middleware/parse_ox/version'

Gem::Specification.new do |spec|
  spec.name          = 'faraday_middleware-parse_ox'
  spec.version       = FaradayMiddleware::ParseOx::VERSION
  spec.authors       = ['Vladimir Valgis']
  spec.email         = ['vladimir.valgis@gmail.com']
  spec.summary       = %q{Faraday middleware for parsing response using ox}
  spec.description   = %q{Faraday middleware for parsing response using ox. Based on faraday_middleware-parse_oj from 7even}
  spec.homepage      = 'https://github.com/vvalgis/faraday_middleware-parse_ox'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9'
  spec.add_runtime_dependency 'ox', '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'
end
