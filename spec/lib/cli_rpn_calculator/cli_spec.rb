RSpec.describe CLI do
  subject { described_class.new(terminal: terminal) }

  let(:logger) { Logger.new(Helpers::FileLog.name) }
  let(:terminal) { IOProviders::Console.new(logger: logger) }
  let(:operators) do
    [
      Operators::Addition,
      Operators::Division,
      Operators::Multiplication,
      Operators::Subtraction,
      Operators::Sin
    ]
  end
  let(:commands) do
    [
      Commands::Instructions,
      Commands::Wikipedia,
      Commands::WelcomeMessage,
      Commands::CheckStack,
      Commands::ClearStack
    ]
  end

  context 'when constants' do
    it { expect(described_class::OPERATORS).to eq(operators) }
    it { expect(described_class::COMMANDS).to eq(commands) }
  end
end
