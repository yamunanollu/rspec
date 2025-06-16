class StringCalculator
  def add(str)
   return 0 if str.strip.empty?

   delimiter = /,|\n/
   if str.start_with?("//")
      lines = str.lines
      delimiter_line = lines.first
      str = lines[1..-1].join
      delimiter = Regexp.escape(delimiter_line[2..-2])
   end

   numbers = str.split(/#{delimiter}/).map(&:to_i)

   # Check for negatives
   negative_numbs = numbers.select { |n| n < 0 }
   unless negative_numbs.empty?
    raise "negative numbers not allowed #{negative_numbs.join(', ')}"
   end

   return numbers.sum
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

   it 'calling add method with //;\n1;2' do
      string = StringCalculator.new
      result = string.add("//;\n1;2")
      expect(result).to eq(3)
   end

   it 'calling add method with 1,-2,3' do
      string = StringCalculator.new
      expect {string.add("1,-2,3")}.to raise_error("negative numbers not allowed -2")
   end

    it 'calling add method with 1,-2,3,-5' do
      string = StringCalculator.new
      expect {string.add("1,-2,3,-5")}.to raise_error("negative numbers not allowed -2, -5")
   end
end