module Operators
  class Pythagorean < Base
    OPERATOR = 'pythagorean'.freeze

    class << self
      def applicable?(operator)
        operator == OPERATOR
      end

      def execute(a, b)
        Math.sqrt(a * a + b * b)
      end
    end
  end
end
