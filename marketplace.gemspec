# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marketplace/version'

Gem::Specification.new do |spec|
  spec.name          = 'marketplace'
  spec.version       = Marketplace::VERSION
  spec.authors       = ['Hakan Ensari']
  spec.email         = ['hakan.ensari@papercavalier.com']
  spec.summary       = 'Amazon Marketplaces'
  spec.homepage      = 'https://github.com/papercavalier/marketplace'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
