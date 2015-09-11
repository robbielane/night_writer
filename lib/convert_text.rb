require_relative 'charmap'
require 'pry'
class ConvertText

  def self.to_braille(message)
    chunks = to_chunk(message.chomp)
    braille = ''
    chunks.each do |chunk|
      braille += chunk_to_char(chunk)
    end
    braille
  end

  def self.to_chunk(message)
    chunks = []
    message.gsub!(/([A-Z])/, '^\1').downcase! if message =~ /[A-Z]/
    message.gsub!(/(\b[0-9])/, '#\1') if message =~ /[0-9]/
    chunks << message.slice!(0..39) until message == ''
    chunks
  end

  def self.chunk_to_char(chunk)
    braille_line =  chunk.chars.map { |char| CHARMAP[char][0] }.join + "\n"
    braille_line += chunk.chars.map { |char| CHARMAP[char][1] }.join + "\n"
    braille_line += chunk.chars.map { |char| CHARMAP[char][2] }.join
    braille_line += "\n\n" if chunk.chars.count == 40
    braille = braille_line
  end
end
