require './test/test_helper'
require './lib/shifts'

class ShiftsTest < Minitest::Test
  def setup
    @shift = Shifts.new({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
  end

  def test_it_exists
    assert_instance_of Shifts, @shift
  end

  def test_it_has_A_B_C_D_shifts
    assert_equal 3, @shift.a_shift
    assert_equal 27, @shift.b_shift
    assert_equal 73, @shift.c_shift
    assert_equal 20, @shift.d_shift
  end
end
