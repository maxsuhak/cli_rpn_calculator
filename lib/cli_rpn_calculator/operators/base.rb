module Operators
  class Base
    ALLOWED_NUMBER_OF_OPERANDS = 2

    class << self
      def number_of_operands
        ALLOWED_NUMBER_OF_OPERANDS
      end

      def applicable?(operator)
        raise NotImplementedError
      end

      def execute(a, b)
        raise NotImplementedError
      end
    end
  end
end
