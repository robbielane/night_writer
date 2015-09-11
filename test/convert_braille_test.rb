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

  def test_all_characters_convert_from_braille_to_text
    assert_equal "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!',.-? 1234567890",
    ConvertBraille.to_text("0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00\n..0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0........0...0..0...00\n....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0...0...0...0..\n\n..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.....\n..00..0...00......0........0...0..0...00..00..0...00......0...00.......0...000..\n.0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.000.000.0000.0.\n\n...........00.0.00000.00000..0.0\n0.00..0....0..0....0.00.00000.00\n...00000..00....................")
  end

  def test_converts_braille_numbers_to_text
    assert_equal "123 456 7890", ConvertBraille.to_text(".00.0.00...0000.00...0000..0.0\n.0..0......0.0.00....000000.00\n00........00........00........") 
  end
end
