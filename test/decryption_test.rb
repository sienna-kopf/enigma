require './test/test_helper'
require './lib/decryption'
require './lib/shifts'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new
    @shifts = Shifts.new
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_is_initialized_with_a_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @decryption.character_set
    assert_equal 27, @decryption.character_set.count
    assert_equal "a", @decryption.character_set[0]
  end

  def test_it_can_create_an_index_to_letter_hash_for_character_set
    expected = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n", 14=>"o", 15=>"p", 16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u", 21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z", 26=>" "}
    assert_equal expected, @decryption.indexed_alphabet
  end
end
