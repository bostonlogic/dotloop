require 'bundler/setup'
Bundler.setup

require 'plissken'
require 'pry'
require 'webmock/rspec'
require_relative './helpers/webmocks'
require_relative './helpers/fixtures'

ROOT = Pathname.new(Gem::Specification.find_by_name('dotloop').gem_dir).freeze
require 'dotloop'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |conf|
  conf.include Fixtures
  conf.include Helpers
end
