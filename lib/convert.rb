require 'pry'

CHARMAP = {'a' => [['0', '.'], ['.', '.'], ['.', '.']],
           'b' => [['0', '.'], ['0', '.'], ['.', '.']],
           'c' => [['0', '0'], ['.', '.'], ['.', '.']],
           'd' => [['0', '0'], ['.', '0'], ['.', '.']],
           'e' => [['0', '.'], ['.', '0'], ['.', '.']],
           'f' => [['0', '0'], ['0', '.'], ['.', '.']],
           'g' => [['0', '0'], ['0', '0'], ['.', '.']],
           'h' => [['0', '.'], ['0', '0'], ['.', '.']],
           'i' => [['.', '0'], ['0', '.'], ['.', '.']],
           'j' => [['.', '0'], ['0', '0'], ['.', '.']],
           'k' => [['0', '.'], ['.', '.'], ['0', '.']],
           'l' => [['0', '.'], ['0', '.'], ['0', '.']],
           'm' => [['0', '0'], ['.', '.'], ['0', '.']],
           'n' => [['0', '0'], ['.', '0'], ['0', '.']],
           'o' => [['0', '.'], ['.', '0'], ['0', '.']],
           'p' => [['0', '0'], ['0', '.'], ['0', '.']],
           'q' => [['0', '0'], ['0', '0'], ['0', '.']],
           'r' => [['0', '.'], ['0', '0'], ['0', '.']],
           's' => [['.', '0'], ['0', '.'], ['0', '.']],
           't' => [['.', '0'], ['0', '0'], ['0', '.']],
           'u' => [['0', '.'], ['.', '.'], ['0', '0']],
           'v' => [['0', '.'], ['0', '.'], ['0', '0']],
           'w' => [['.', '0'], ['0', '0'], ['.', '0']],
           'x' => [['0', '0'], ['.', '.'], ['0', '0']],
           'y' => [['0', '0'], ['.', '0'], ['0', '0']],
           'z' => [['0', '.'], ['.', '0'], ['0', '0']],
           ' ' => [['.', '.'], ['.', '.'], ['.', '.']],
           '^' => [['.', '.'], ['.', '.'], ['.', '0']]}


class Convert

  def self.to_braille(message)
    chunks = to_chunk(message.chomp)
    braille = ''
    chunks.map do |chunk|
      braille_line =  chunk.chars.map { |char| CHARMAP[char][0] }.join + "\n"
      braille_line += chunk.chars.map { |char| CHARMAP[char][1] }.join + "\n"
      braille_line += chunk.chars.map { |char| CHARMAP[char][2] }.join
      braille_line += "\n\n" if chunk.chars.count == 40 
      braille += braille_line
    end
    braille
  end

  def self.to_chunk(message)
    chunks = []
    message.gsub!(/([A-Z])/, '^\1').downcase! if message =~ /[A-Z]/
    chunks << message.slice!(0..39) until message == ''
    chunks
  end



end
