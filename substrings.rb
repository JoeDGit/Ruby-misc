# frozen_string_literal: true

def substrings(word, dictionary)
  word = word.downcase
  match = {}
  dictionary.each { |dict|
    if word.include?(dict)
      match[dict] = word.scan(/(?=#{dict})/).count
    end
  }
  puts match
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
