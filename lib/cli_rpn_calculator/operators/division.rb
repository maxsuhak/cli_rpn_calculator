module Operators
  class Division < Base
    OPERATOR = '/'.freeze

    class << self
      def applicable?(operator)
        operator == OPERATOR
      end

      def execute(a, b)
        raise ArgumentError, 'Division by zero' if b.zero?

        a / b
      end
    end
  end
end
