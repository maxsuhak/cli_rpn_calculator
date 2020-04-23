module Operators
  class Addition < Binary
    class << self
      def applicable?(operator)
        operator == '+'
      end

      def execute(a, b)
        a + b
      end
    end
  end
end
