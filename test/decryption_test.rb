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
    expected = [" ", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]

    assert_equal expected, @decryption.character_set
    assert_equal 27, @decryption.character_set.count
    assert_equal " ", @decryption.character_set[0]
  end

  def test_it_can_create_an_index_to_alphabet_hash_for_character_set
    expected = {0=>" ", 1=>"z", 2=>"y", 3=>"x", 4=>"w", 5=>"v", 6=>"u", 7=>"t", 8=>"s", 9=>"r", 10=>"q", 11=>"p", 12=>"o", 13=>"n", 14=>"m", 15=>"l", 16=>"k", 17=>"j", 18=>"i", 19=>"h", 20=>"g", 21=>"f", 22=>"e", 23=>"d", 24=>"c", 25=>"b", 26=>"a"}
    assert_equal expected, @decryption.index_to_alphabet
    assert_equal 27, @decryption.index_to_alphabet.count
    assert_equal " ", @decryption.index_to_alphabet[0]
  end

  def test_it_can_create_a_alphabet_to_index_hash_for_character_set
    expected = {" "=>0, "z"=>1, "y"=>2, "x"=>3, "w"=>4, "v"=>5, "u"=>6, "t"=>7, "s"=>8, "r"=>9, "q"=>10, "p"=>11, "o"=>12, "n"=>13, "m"=>14, "l"=>15, "k"=>16, "j"=>17, "i"=>18, "h"=>19, "g"=>20, "f"=>21, "e"=>22, "d"=>23, "c"=>24, "b"=>25, "a"=>26}
    assert_equal expected, @decryption.alphabet_to_index
    assert_equal 27, @decryption.alphabet_to_index.count
    assert_equal 0, @decryption.alphabet_to_index[' ']
  end

  def test_it_can_decrypt_a_message
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "hello world", @decryption.crypt_message("keder ohulw", @shifts.shifts)
    assert_equal "02715", @shifts.padded_number
    assert_equal [3, 27, 73, 20], @shifts.shifts
  end

  def test_it_can_decrypt_a_message_that_contains_characters_outside_of_character_set
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "hello world!", @decryption.crypt_message("keder ohulw!", @shifts.shifts)
    assert_equal "02715", @shifts.padded_number
    assert_equal [3, 27, 73, 20], @shifts.shifts
  end

  def test_it_can_decrypt_a_message_of_a_different_case
    @shifts.stubs(:random_number).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 04))

    assert_equal "hello world", @decryption.crypt_message("KEDER OHULW", @shifts.shifts)
    assert_equal "02715", @shifts.padded_number
    assert_equal [3, 27, 73, 20], @shifts.shifts
  end
end
