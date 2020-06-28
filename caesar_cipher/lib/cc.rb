#lib/cc.rb
class Cc
  def caesar_cipher(string, shift)
    lower_string = string.to_s.downcase
    char_array = lower_string.split(//)
    num_array = char_array.map!(&:ord).map!(&:to_i)
    shifted_array = []
    num_array.map! { |int| int + shift }
    num_array.each do |value|
      if value > 122
        y = value - 122
        n = 96 + y
        shifted_array << n
      elsif value < 97
        shifted_array << (122 - (97 - value))
      else shifted_array << value
      end
    end
    shifted_array.map!(&:chr)
    shifted_array.join
  end
end