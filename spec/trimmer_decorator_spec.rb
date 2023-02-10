require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  describe '#correct_name' do
    let(:nameable) { double('Nameable', correct_name: 'long name') }
    subject(:trimmer) { TrimmerDecorator.new(nameable) }

    context 'when the correct_name length is greater than 10' do
      it 'returns the first 10 characters of the name' do
        expect(trimmer.correct_name).to eq('long name'.slice(0, 10))
      end
    end

    context 'when the correct_name length is less than or equal to 10' do
      let(:nameable) { double('Nameable', correct_name: 'short name') }

      it 'returns the correct_name as it is' do
        expect(trimmer.correct_name).to eq('short name')
      end
    end
  end
end
