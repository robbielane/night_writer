require_relative '../lib/convert_braille'

class ConvertBrailleTest < Minitest::Test
  def test_converts_braille_letter_to_text_letter
    assert_equal 't', ConvertBraille.to_text(".0\n00\n0.")
  end

  def test_converts_braille_string_to_text
    assert_equal 'Robbie', ConvertBraille.to_text("..0.0.0.0..00.\n..00.00.0.0..0\n.00.0.........")
  end

  def test_braille_gets_dechunkified
    assert_equal "This is a multiline message it is longer than forty characters", ConvertBraille.to_text("...00..0.0...0.0..0...000.0..0.00..0000...000..0.00.000....0.0...0.0..0.0.00000.\n..00000.0...0.0...........0.000.0.0..0.0.....00.0...00.0..0.00..0.0...0..0.000.0\n.00.....0.....0.......0.000.0...0...0.....0...0.0...........0.....0...0.0.0.....\n\n0....00.0.00..000.0..000..000.0.0.0.00.00.0..0\n00..0000...0..0..00000.0....00..00....00.0000.\n0...0.....0.....0.0.0.00........0.....0...0.0.")
  end
end
