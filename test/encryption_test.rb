require './test/test_helper'
require './lib/encryption'
require './lib/shifts'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new
    @shifts = Shifts.new
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_it_is_initialized_with_a_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @encryption.character_set
    assert_equal 27, @encryption.character_set.count
    assert_equal "a", @encryption.character_set[0]
  end

  def test_it_can_encrypt_a_message
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "keder ohulw", @encryption.encrypt_message("hello world")
  end
end
