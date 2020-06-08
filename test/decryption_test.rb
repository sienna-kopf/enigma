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
end 
