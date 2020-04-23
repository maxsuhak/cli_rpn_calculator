RSpec.describe CLIRPNCalculator do
  subject { described_class.new }

  before do
    stub_const 'STDIN', double
    allow(STDOUT).to receive(:print).with('> ')
  end

  context '#start' do
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
end
