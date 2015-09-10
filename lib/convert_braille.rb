require_relative 'charmap'
class ConvertBraille
  def self.to_text(braille)
    line_chars = {}
    braille.lines.map.with_index do |line, index|
      line_chars[index] = line.chomp.chars
    end
    line_chars = dechunkify(line_chars)
    chars = lines_to_chars(line_chars)
    string = ''
    chars.each { |index, value| string += CHARMAP.key(value) }
    add_upcase(string)
    string
  end

  def self.lines_to_chars(lines)
    line_pairs = {}
    lines.each_with_index do |line, index|
      line_pairs[index] = []
      line[1].each_slice(2) { |letter_pair| line_pairs[index] << letter_pair }
    end
    chars = {}
    line_pairs[0].length.times { |index| chars[index] = [] }
    line_pairs[0].length.times { |index| chars[index]<< line_pairs[0].shift }
    line_pairs[1].length.times { |index| chars[index]<< line_pairs[1].shift }
    line_pairs[2].length.times { |index| chars[index]<< line_pairs[2].shift }
    chars
  end

  def self.add_upcase(string)
    string.gsub!(/(\^.)/, &:upcase) if string.include?('^')
    string.gsub!('^', '') if string.include?('^')
  end

  def self.dechunkify(lines)
    complete_lines = {}
    complete_lines[0] = []
    complete_lines[1] = []
    complete_lines[2] = []
    lines.delete_if { |line, value| value.empty? }
    lines.values.each_slice(3) do |one, two, three|
      complete_lines[0] << one
      complete_lines[1] << two
      complete_lines[2] << three
    end
    complete_lines.values.each { |line| line.flatten! }
    complete_lines
  end
end
