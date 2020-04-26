require_relative './bin/boot'

calculator = CLIRPNCalculator.new(options: { 'input' => 'console', 'output' => 'console' })

calculator.welcome_message
calculator.start
