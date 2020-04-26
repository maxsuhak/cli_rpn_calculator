require 'logger'
require './lib/cli_rpn_calculator/operators/base'

Dir["#{ROOT}/lib/cli_rpn_calculator/operators/*.rb"].sort.each { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/commands/*.rb"].sort.each  { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/**/*.rb"].sort.each        { |file| require file }

class CLIRPNCalculator
  attr_accessor :terminal, :calculator, :logger

  def initialize
    self.logger = Logger.new(file_name)
    self.terminal = Terminal.new(logger: logger)
    self.calculator = CLI.new(terminal: terminal)
  end

  def welcome_message
    terminal.write(Commands::WelcomeMessage.execute)
    terminal.write(Commands::Instructions.execute)
  end

  def start
    loop do
      input = terminal.read
      if Tokenizer.eof?(input)
        terminal.write('Calculation terminated. Goodbye!')
        break
      end

      begin
        calculator.apply(input.downcase)
      rescue ArgumentError => e
        terminal.write e.message, 'error'
      end
    end
  end

  private

  def file_name
    if ENV['PRODUCTION']
      'tmp/production.log'
    else
      ENV['TEST'] ? 'tmp/test.log' : 'tmp/development.log'
    end
  end
end
