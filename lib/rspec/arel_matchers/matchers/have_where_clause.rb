module RSpec
  module ArelMatchers
    module Matchers
      class HaveWhereClause < RSpec::Matchers::BuiltIn::BaseMatcher
        include ::RSpec::ArelMatchers::Helpers

        def initialize(cls, left, operator, right)
          @cls = cls
          # left operant is converted by active_record to a string in some cases, but not all
          @left = indifferent_string left
          @operator = operator
          @right = right
        end

        def matches?(actual)
          @actual = actual
          actual.where_values.any? { |v| expected == v }
        end

        def expected
          @cls.arel_table[@left].send(@operator, @right)
        end

        def failure_message
          "expected\n#{PP.pp actual.where_values, ''}\nto contain\n" \
          "#{PP.pp expected, ''}"
        end

        def failure_message_when_negated
          "expected\n#{PP.pp actual.where_values, ''}\nto not contain\n" \
          "#{PP.pp expected, ''}"
        end
      end

      def have_where_clause(*args)
        HaveWhereClause.new(*args)
      end
    end
  end
end
