require './test/test_helper'
require './lib/shifts'
require './lib/enigma'
require './lib/decryption'
require './lib/encryption'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message_with_key_and_date
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_key_and_date
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_only_a_key
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    expected = {
      encryption: "nib udmcxpu",
      key: "02715",
      date: "060620"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_only_a_key
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    encrypted = @enigma.encrypt("hello world", "02715")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "060620"
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
