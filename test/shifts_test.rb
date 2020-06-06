require './test/test_helper'
require './lib/shifts'

class ShiftsTest < Minitest::Test
  def setup
    @shift = Shifts.new({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
  end

  def test_it_exists
    assert_instance_of Shifts, @shift
  end
end 
