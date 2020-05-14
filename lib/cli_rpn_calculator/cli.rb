require 'bigdecimal'

class CLI
  OPERATORS = [
    Operators::Addition,
    Operators::Division,
    Operators::Multiplication,
    Operators::Subtraction,
    Operators::Sin
  ].freeze

  COMMANDS = [
    Commands::Instructions,
    Commands::Wikipedia,
    Commands::WelcomeMessage,
    Commands::CheckStack,
    Commands::ClearStack
  ].freeze

  def initialize(io:)
    @operands = []
    @message  = false
    @io       = io
  end

  def apply(str)
    tokens = Helpers::Tokenizer.tokenize(str)
    tokens.each { |token| process_token(token) }
    @io.write @operands.last unless @message
  end

  private

  def numeric?(str)
    !Float(str).nil?
  rescue ArgumentError
    false
  end

  def execute_operator_or_command(token)
    (OPERATORS + COMMANDS).each do |class_name|
      return send("apply_#{get_module_name(class_name)}", class_name) if class_name.applicable?(token)
    end

    raise ArgumentError, "'#{token}' isn't a supported operator or command. " \
                         "Please, use 'i' for more info."
  end

  def get_module_name(class_name)
    class_name.to_s.split('::').first.downcase[0...-1]
  end

  def process_token(token)
    @message = false

    if numeric?(token)
      @operands << BigDecimal(token)
    else
      execute_operator_or_command(token)
    end
  end

  def validate_operator(operator)
    return unless operator.number_of_operands > @operands.length

    raise ArgumentError, 'There are not enough operands to complete operation.'
  end

  def apply_operator(operator)
    validate_operator(operator)
    current_operands = @operands.pop(operator.number_of_operands)
    @operands << operator.execute(*current_operands)
  end

  def apply_command(command)
    @message = true
    @io.write command.execute
  end
end
