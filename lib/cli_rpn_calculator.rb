require './lib/cli_rpn_calculator/operators/binary'

Dir["#{ROOT}/lib/cli_rpn_calculator/operators/*.rb"].sort.each { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/commands/*.rb"].sort.each  { |file| require file }
Dir["#{ROOT}/lib/cli_rpn_calculator/**/*.rb"].sort.each        { |file| require file }

class CLIRPNCalculator
  attr_accessor :terminal, :calculator

  def initialize
    self.terminal = Terminal.new
    self.calculator = CLI.new
  end

  def welcome_message
    Commands::WelcomeMessage.execute
    Commands::Instructions.execute
  end

  def start
    loop do
      input = terminal.read
      if Tokenizer.eof?(input)
        puts 'Calculation terminated. Goodbye!'
        break
      end

      begin
        output = calculator.apply(input.downcase)
        terminal.write(output)
      rescue ArgumentError => e
        terminal.write e.message
      end
    end
  end
end
