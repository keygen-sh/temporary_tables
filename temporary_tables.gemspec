# frozen_string_literal: true

require_relative "lib/temporary_tables/version"

Gem::Specification.new do |spec|
  spec.name        = 'temporary_tables'
  spec.version     = TemporaryTables::VERSION
  spec.authors     = ['Zeke Gabrielse']
  spec.email       = ['oss@keygen.sh']
  spec.summary     = 'Create temporary tables for Rspec tests.'
  spec.description = 'Create temporary tables for Rspec tests.'
  spec.homepage    = 'https://github.com/keygen-sh/temporary_tables'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.1'
  spec.files                 = %w[LICENSE CHANGELOG.md CONTRIBUTING.md SECURITY.md README.md] + Dir.glob('lib/**/*')
  spec.require_paths         = ['lib']

  spec.add_dependency 'rails', '>= 6.0'

  spec.add_development_dependency 'rspec-rails'
end
