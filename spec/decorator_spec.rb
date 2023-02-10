require_relative '../nameable'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { double(:nameable, correct_name: 'John') }
  subject(:decorator) { Decorator.new(nameable) }

  it 'calls correct_name on the nameable object' do
    expect(nameable).to receive(:correct_name)
    decorator.correct_name
  end

  it 'returns the correct name' do
    expect(decorator.correct_name).to eq 'John'
  end
end
