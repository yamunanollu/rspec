class StringCalculator
  def add(str)
    0
  end
end


RSpec.describe StringCalculator do
   it 'calling add method with empty string' do
    string = StringCalculator.new
    result = string.add("")
    expect(result).to eq(0)
  end
end