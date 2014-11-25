module RSpec
  module ArelMatchers
    module Helpers
      module IndifferentString
        def ==(other)
          super(other.to_s)
        end
      end
      def indifferent_string(str_or_sym)
        str_or_sym.to_s.tap { |str| str.extend IndifferentString }
      end
    end
  end
end
