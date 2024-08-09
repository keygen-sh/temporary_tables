# frozen_string_literal: true

require 'temporary_tables'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:',
)

RSpec.configure do |config|
  config.expect_with(:rspec) { _1.syntax = :expect }
  config.disable_monkey_patching!
end
