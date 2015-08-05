# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-crest/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-crest'
  s.version       = OmniAuth::Crest::VERSION
  s.authors       = ['Manuel Hutter']
  s.email         = ['git@mhutter.net']

  s.summary       = 'OmniAuth strategy for CREST/EVE Online'
  s.description   = 'OmniAuth strategy for CREST/EVE Online'
  s.homepage      = 'https://github.com/mhutter/omniauth-crest'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'
  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'rack-test'
end
