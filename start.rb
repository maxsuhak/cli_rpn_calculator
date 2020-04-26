require_relative './bin/boot'

calculator = CLIRPNCalculator.new(options: { 'io' => 'console' })

calculator.welcome_message
calculator.start
