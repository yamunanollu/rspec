class StringCalculator
  def add(str)
   if str.nil?
      0
   else
      str.split(/,|\n/).map(&:to_i).sum
   end
  end
end


RSpec.describe StringCalculator do
   it 'calling add method with empty string' do
    string = StringCalculator.new
    result = string.add("")
    expect(result).to eq(0)
  end

  it 'calling add method with 1' do
    string = StringCalculator.new
    result = string.add("1")
    expect(result).to eq(1)
  end

  it 'calling add method with 1,5' do
    string = StringCalculator.new
    result = string.add("1,5")
    expect(result).to eq(6)
  end

  it 'calling add method with 1\n2,3' do
    string = StringCalculator.new
    result = string.add("1\n2,3")
    expect(result).to eq(6)
  end
end