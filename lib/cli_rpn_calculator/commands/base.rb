module Commands
  class Base
    class << self
      def applicable?(command)
        raise NotImplementedError
      end

      def execute
        raise NotImplementedError
      end
    end
  end
end
