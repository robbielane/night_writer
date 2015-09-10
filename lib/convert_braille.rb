require_relative 'charmap'
class ConvertBraille
  def self.to_text(braille)
    line_characters = break_lines_into_characters(braille)

    line_characters = dechunkify(line_characters)
    chars = lines_to_chars(line_characters)
    string = ''
    chars.each { |index, value| string += CHARMAP.key(value) }
    add_upcase(string)
    string
  end

  def self.break_lines_into_characters(braille)
    line_characters = {}
    braille.lines.each_with_index do |line, index|
      line_characters[index] = line.chomp.chars
    end
    line_characters
  end

  def self.lines_to_chars(lines)
    line_pairs = {}
    lines.each_with_index do |line, index|
      line_pairs[index] = []
      line[1].each_slice(2) { |letter_pair| line_pairs[index] << letter_pair }
    end
    chars = {}
    line_pairs[0].length.times { |index| chars[index] = [] }
    line_pairs[0].length.times { |index| chars[index] << line_pairs[0].shift }
    line_pairs[1].length.times { |index| chars[index] << line_pairs[1].shift }
    line_pairs[2].length.times { |index| chars[index] << line_pairs[2].shift }
    chars
  end

  def self.add_upcase(string)
    string.gsub!(/(\^.)/, &:upcase) if string.include?('^')
    string.gsub!('^', '') if string.include?('^')
  end

  def self.dechunkify(lines)
    dechunkified_lines = {}
    3.times { |n| dechunkified_lines[n] = [] }
    lines.delete_if { |line, value| value.empty? }
    lines.values.each_slice(3) do |one, two, three|
      dechunkified_lines[0] << one
      dechunkified_lines[1] << two
      dechunkified_lines[2] << three
    end
    dechunkified_lines.values.each { |line| line.flatten! }
    dechunkified_lines
  end
end
