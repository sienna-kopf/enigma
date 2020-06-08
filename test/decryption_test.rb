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
end
