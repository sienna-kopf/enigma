require './test/test_helper'
require './lib/encryption'
require './lib/shifts'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption 
  end
end
