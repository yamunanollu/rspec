RSpec.describe StringCalculator do
   it 'calling add method with empty string' do
    string = StringCalculator.new
    result = string.add("")
    expect(result).to eq(0)
  end
end