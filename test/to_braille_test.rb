require_relative '../lib/convert'

class ConvertTest < Minitest::Test
 def test_converts_letter_to_braille
   assert_equal ".0\n00\n0.", Convert.to_braille('t')
 end

 def test_converts_string_to_braille
   assert_equal "0.0.0.0..00.\n00.00.0.0..0\n0.0.........", Convert.to_braille('robbie')
 end
end
