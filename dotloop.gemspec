# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotloop/version'

Gem::Specification.new do |spec|
  spec.name          = 'dotloop'
  spec.version       = Dotloop::VERSION
  spec.authors       = ['Paul Dornfeld']
  spec.email         = ['pdornfel@gmail.com']

  spec.summary       = %(Dotloop library forked from https://github.com/Loft47/dotloop)
  spec.description   = %(Ruby library for Dotloop API. Using Curb instead of HTTParty and capatable with pre ruby 1.9.3 versions)
  spec.homepage      = %(https://github.com/pdornfel/dotloop)
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'curb', '~> 0.8.0'
  spec.add_runtime_dependency 'oj', '~> 2.5.4'
  spec.add_runtime_dependency 'rash', '~> 0.4.0'
  spec.add_runtime_dependency 'model_attribute', '~> 3.0.0'
  spec.add_runtime_dependency 'plissken', '~> 0.2'
  spec.add_runtime_dependency 'addressable'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'rubocop', '~> 0.41'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'travis', '~> 1.8'
end
