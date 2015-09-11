require 'minitest/autorun'
require_relative '../lib/convert_text'


class ConvertTextTest < Minitest::Test
 def test_converts_one_letter_to_braille
   assert_equal ".0\n00\n0.", ConvertText.to_braille('t')
 end

 def test_converts_number_to_braille
   assert_equal ".00.\n.0..\n00..", ConvertText.to_braille("1")
 end

 def test_converts_string_of_number_to_braille
   assert_equal ".00.0.\n.0..0.\n00....", ConvertText.to_braille("12")
 end

 def test_converts_string_to_braille
   assert_equal "0.0.0.0..00.\n00.00.0.0..0\n0.0.........", ConvertText.to_braille('robbie')
 end

 def test_all_characters_convert_from_text_to_braille
   assert_equal "0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00\n..0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0........0...0..0...00\n....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0...0...0...0..\n\n..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.....\n..00..0...00......0........0...0..0...00..00..0...00......0...00.......0...0000.\n.0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.000.000.0000.00\n\n...........00.0.00000.00000..0.0\n0.....00...0..0....0.00.00000.00\n..0.00.0..00....................",
                ConvertText.to_braille("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!?,'-. 1234567890")
 end

 def test_braille_is_broken_into_eighty_character_chunks
   braille = ConvertText.to_braille("This is a test to see if the braille output is eighty characters long")

   assert_equal 80, braille.lines[0].chomp.chars.count
   assert_equal 80, braille.lines[1].chomp.chars.count
   assert_equal 80, braille.lines[2].chomp.chars.count
 end
end
