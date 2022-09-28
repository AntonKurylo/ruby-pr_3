ALPHABET = "abcdefghijklmnopqrstuvwxyz"

puts "Введите строку:"
letters = STDIN.gets.encode("UTF-8").downcase.split("")
positions = Array.new

letters.each do |char|
  if char.upcase != char.downcase
    positions << (ALPHABET.index(char).to_i + 1).to_s
  end
end

puts "Позиция по алфавиту символов строки:"
puts "#{positions.join(", ")}"