require 'logger'

require './lib/cli_rpn_calculator/operators/base'
require './lib/cli_rpn_calculator/commands/base'
require './lib/cli_rpn_calculator/io_providers/base'

Dir["#{ROOT}/lib/cli_rpn_calculator/helpers/*.rb"].sort.each      { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/io_providers/*.rb"].sort.each { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/operators/*.rb"].sort.each    { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/commands/*.rb"].sort.each     { |file| require file }

require './lib/cli_rpn_calculator/cli'

class CLIRPNCalculator
  attr_accessor :calculator, :logger, :input, :output, :options

  def initialize(options: {})
    self.options    = options
    self.logger     = Logger.new(Helpers::FileLog.name)
    self.input      = IOProviders::Console.new(logger: logger) if options['input']  == 'console'
    self.output     = IOProviders::Console.new(logger: logger) if options['output'] == 'console'
    self.calculator = CLI.new(output: output)
  end

  def welcome_message
    output.write(Commands::WelcomeMessage.execute, 'info')
    output.write(Commands::Instructions.execute, 'info')
  end

  def start
    loop do
      input_line = input.read
      if Helpers::Tokenizer.eof?(input_line)
        output.write('Calculation terminated. Goodbye!', 'info')
        break
      end

      begin
        calculator.apply(input_line.downcase)
      rescue ArgumentError => e
        output.write e.message, 'error'
      end
    end
  end
end
