require 'logger'

require './lib/cli_rpn_calculator/operators/base'
require './lib/cli_rpn_calculator/commands/base'
require './lib/cli_rpn_calculator/io_providers/base'

Dir["#{ROOT}/lib/cli_rpn_calculator/*/*.rb"].sort.each { |file| require file }

require './lib/cli_rpn_calculator/cli'

class CLIRPNCalculator
  def initialize(options: {})
    @options    = options
    @logger     = Logger.new(Helpers::FileLog.name)
    @io         = io_provider
    @calculator = CLI.new(io: @io)
  end

  def welcome_message
    @io.write(Commands::WelcomeMessage.execute, 'info')
    @io.write(Commands::Instructions.execute, 'info')
  end

  def start
    loop do
      input = @io.read
      if Helpers::Tokenizer.eof?(input)
        @io.write('Calculation terminated. Goodbye!', 'info')
        break
      end

      begin
        @calculator.apply(input.downcase)
      rescue ArgumentError => e
        @io.write e.message, 'error'
      end
    end
  end

  private

  def io_provider
    case @options['io']
    when 'console'
      IOProviders::Console.new(logger: @logger)
    when 'file'
      raise NotImplementedError
    else
      raise NotImplementedError
    end
  end
end
