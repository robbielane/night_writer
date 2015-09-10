require 'minitest/autorun'
require_relative '../lib/convert'

class ConvertTest < Minitest::Test
 def test_converts_letter_to_braille
   assert_equal ".0\n00\n0.", Convert.to_braille('t')
 end

 def test_converts_string_to_braille
   assert_equal "0.0.0.0..00.\n00.00.0.0..0\n0.0.........", Convert.to_braille('robbie')
 end

 def test_braille_is_only_80_characters_long
   braille = Convert.to_braille("This is a test to see if the braille output is eighty characters long")

   assert_equal 80, braille.lines[0].chomp.chars.count
   assert_equal 80, braille.lines[1].chomp.chars.count
   assert_equal 80, braille.lines[2].chomp.chars.count
 end
end
