require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message_with_key_and_date
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_key_and_date
    skip
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_only_a_key
    skip
    expected = {
      encryption: "",
      key: "02715",
      date: ""
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_only_a_key
    skip
    encrypted = @enigma.encrypt("hello world", "02715")
    expected = {
      decryption: "",
      key: "02715",
      date: ""
    }
    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_with_just_a_message
    skip 
    expected = {
      encryption: "",
      key: "",
      date: ""
    }
    assert_equal expected, @enigma.encrypt("hello world")
  end
end
