RSpec.describe CLIRPNCalculator do
  subject { described_class.new(options: { 'io' => 'console' }) }

  before do
    stub_const 'STDIN', double
    allow(STDOUT).to receive(:print).with('> ')
  end

  context '#welcome_message' do
    it 'returns welcome message' do
      expect(STDOUT).to receive(:puts).with('Welcome to the CLI RPN Calculator!')
      expect(STDOUT).to receive(:puts).with(
        "Press 'i' for instructions on use.\n" +
        "Press '?' for a link to more info about RPN.\n" +
        "Press 's' to see the current stack.\n" +
        "Press 'c' to clear the current stack.\n" +
        "Press 'w' to repeat this welcome message.\n" +
        "Press 'q' to quit."
      )
      subject.welcome_message
    end
  end

  context '#start' do
    describe 'check operators' do
      it 'processes test case #1 and quits' do
        expect(STDIN).to receive(:gets).and_return('5')
        expect(STDOUT).to receive(:puts).with(5.0)

        expect(STDIN).to receive(:gets).and_return('8')
        expect(STDOUT).to receive(:puts).with(8.0)

        expect(STDIN).to receive(:gets).and_return('+')
        expect(STDOUT).to receive(:puts).with(13.0)

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'processes test case #2 and quits' do
        expect(STDIN).to receive(:gets).and_return('5 8 +')
        expect(STDOUT).to receive(:puts).with(13.0)

        expect(STDIN).to receive(:gets).and_return('13 -')
        expect(STDOUT).to receive(:puts).with(0.0)

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'processes test case #3 and quits' do
        expect(STDIN).to receive(:gets).and_return('-3')
        expect(STDOUT).to receive(:puts).with(-3.0)

        expect(STDIN).to receive(:gets).and_return('-2')
        expect(STDOUT).to receive(:puts).with(-2.0)

        expect(STDIN).to receive(:gets).and_return('*')
        expect(STDOUT).to receive(:puts).with(6.0)

        expect(STDIN).to receive(:gets).and_return('5')
        expect(STDOUT).to receive(:puts).with(5.0)

        expect(STDIN).to receive(:gets).and_return('+')
        expect(STDOUT).to receive(:puts).with(11.0)

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'processes test case #4 and quits' do
        expect(STDIN).to receive(:gets).and_return('5')
        expect(STDOUT).to receive(:puts).with(5.0)

        expect(STDIN).to receive(:gets).and_return('9')
        expect(STDOUT).to receive(:puts).with(9.0)

        expect(STDIN).to receive(:gets).and_return('1')
        expect(STDOUT).to receive(:puts).with(1.0)

        expect(STDIN).to receive(:gets).and_return('-')
        expect(STDOUT).to receive(:puts).with(8.0)

        expect(STDIN).to receive(:gets).and_return('/')
        expect(STDOUT).to receive(:puts).with(0.625)

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'can handle "division by zero"' do
        expect(STDIN).to receive(:gets).and_return('3 0 /')
        expect(STDOUT).to receive(:puts).with('Division by zero')

        expect(STDIN).to receive(:gets).and_return('4 5 +')
        expect(STDOUT).to receive(:puts).with(9)

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'can handle "not enough operands"' do
        expect(STDIN).to receive(:gets).and_return('4 +')
        expect(STDOUT).to receive(:puts).with('There are not enough operands to complete operation.')

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end
    end

    describe 'check commands' do
      it 'get/clear list of operands' do
        expect(STDIN).to receive(:gets).and_return('c')
        expect(STDOUT).to receive(:puts).with('Stack has been cleared!')

        expect(STDIN).to receive(:gets).and_return('5 8 +')
        expect(STDOUT).to receive(:puts).with(13.0)

        expect(STDIN).to receive(:gets).and_return('s')
        expect(STDOUT).to receive(:puts).with('List of operands: [13.0]')

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it '"i" - returns information' do
        expect(STDIN).to receive(:gets).and_return('i')
        expect(STDOUT).to receive(:puts).with(
          "Press 'i' for instructions on use.\n" +
          "Press '?' for a link to more info about RPN.\n" +
          "Press 's' to see the current stack.\n" +
          "Press 'c' to clear the current stack.\n" +
          "Press 'w' to repeat this welcome message.\n" +
          "Press 'q' to quit."
        )

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it '"w" - returns welcome message' do
        expect(STDIN).to receive(:gets).and_return('w')
        expect(STDOUT).to receive(:puts).with('Welcome to the CLI RPN Calculator!')

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it '"?" - returns wikipedia' do
        expect(STDIN).to receive(:gets).and_return('?')
        expect(STDOUT).to receive(:puts).with(
          "For more on Reverse Polish Notation, please follow the link:\n" \
          'https://en.wikipedia.org/wiki/Reverse_Polish_notation'
        )

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end

      it 'can handle "\'t\' isn\'t a supported operator or command. Please, use \'i\' for more info."' do
        expect(STDIN).to receive(:gets).and_return('t')
        expect(STDOUT).to receive(:puts).with("'t' isn't a supported operator or command. Please, use 'i' for more info.")

        expect(STDIN).to receive(:gets).and_return('q')
        expect(STDOUT).to receive(:puts).with('Calculation terminated. Goodbye!')
        subject.start
      end
    end
  end
end
