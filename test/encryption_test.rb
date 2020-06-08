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

  def test_it_can_create_an_index_to_letter_hash_for_character_set
    expected = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n", 14=>"o", 15=>"p", 16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u", 21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z", 26=>" "}
    assert_equal expected, @encryption.indexed_alphabet
  end

  def test_it_can_create_a_letter_to_index_hash_for_character_set
    expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}
    assert_equal expected, @encryption.alphabet_to_index
  end

  def test_it_can_encrypt_a_message
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "keder ohulw", @encryption.encrypt_message("hello world", @shifts.shifts)
    assert_equal "02715", @shifts.padded_random_number
  end

  def test_it_can_encrypt_a_message_that_contains_characters_outside_of_character_set
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "keder ohulw!", @encryption.encrypt_message("hello world!", @shifts.shifts)
  end

  def test_it_can_encrypt_a_message_of_a_different_case
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "keder ohulw", @encryption.encrypt_message("HELLO WORLD", @shifts.shifts)
  end
end
