require_relative '../nameable'

describe 'Nameable' do
  context 'This will test correct name method' do
    it 'raises a NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(
        NotImplementedError, 'OPS, the correct_name has not been implemented, please add a valid name'
      )
    end
  end
end
