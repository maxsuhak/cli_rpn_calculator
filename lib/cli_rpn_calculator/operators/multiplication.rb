module Operators
  class Multiplication < Binary
    class << self
      def applicable?(operator)
        operator == '*'
      end

      def execute(a, b)
        a * b
      end
    end
  end
end
