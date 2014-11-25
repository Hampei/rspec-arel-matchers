require 'spec_helper'

describe 'have_where_clause' do

  class Test < ActiveRecord::Base
    OLD_CUTOFF = 10.days.ago
    scope :active, -> { where(active: true) }
    scope :old, -> { where(Test.arel_table[:updated_at].lt(OLD_CUTOFF)) }
  end
  class Test2 < ActiveRecord::Base
    has_many :tests
  end

  it 'should return true with a simple correct match' do
    expect(Test.where(name: 'john')).to have_where_clause(Test, :name, :eq, 'john')
  end

  it 'should work for joined tables' do
    expect(Test2.joins(:tests).merge(Test.active)).to have_where_clause(Test, :active, :eq, true)
  end

  it 'should fail when a clause is not there' do
    expect(Test.where(name: 'john')).to_not have_where_clause(Test, :name, :eq, 'doe')
  end

  it 'can do other comparisons' do
    expect(Test.old).to have_where_clause(Test, :updated_at, :lt, Test::OLD_CUTOFF)
  end
end
