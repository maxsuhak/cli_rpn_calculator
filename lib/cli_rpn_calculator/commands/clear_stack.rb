module Commands
  class ClearStack
    class << self
      def applicable?(command)
        command == 'c'
      end

      def execute
        ObjectSpace.each_object(CLI) do |instance|
          instance.instance_variable_set(:@operands, [])
        end

        puts 'Stack has been cleared!'
      end
    end
  end
end
