require 'rspec'
require 'active_record'
require 'rspec/arel_matchers'

require 'nulldb_rspec'
include NullDB::RSpec::NullifiedDatabase

RSpec.configure do |config|
  config.before :all do
    ActiveRecord::Base.establish_connection :adapter => :nulldb
  end
  config.include RSpec::ArelMatchers::Matchers
end
