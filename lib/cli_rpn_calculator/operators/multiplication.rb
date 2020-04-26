module Operators
  class Multiplication < Base
    OPERATOR = '*'.freeze

    class << self
      def applicable?(operator)
        operator == OPERATOR
      end

      def execute(a, b)
        a * b
      end
    end
  end
end
