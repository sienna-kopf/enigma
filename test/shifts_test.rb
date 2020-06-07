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

  def test_it_can_generate_a_random_number
    @shift.stubs(:random_number).returns(21923)
    assert_equal 21923, @shift.random_number
  end

  def test_it_can_pad_random_number_with_leading_zeros
    @shift.stubs(:random_number).returns(25)
    assert_equal "00025", @shift.padded_random_number
  end

  def test_it_can_create_an_array_out_of_padded_random_number
    @shift.stubs(:random_number).returns(12345)

    assert_equal ["1", "2", "3", "4", "5"], @shift.random_number_array
    assert_equal 5, @shift.random_number_array.count
  end

  def test_it_can_create_key_pairs_array
    @shift.stubs(:random_number).returns(12345)
    expected = [
      ["1", "2"],
      ["2", "3"],
      ["3", "4"],
      ["4", "5"]]

    assert_equal expected, @shift.key_pairs_array
    assert_equal ["1", "2"], @shift.key_pairs_array[0]
    assert_equal 4, @shift.key_pairs_array.count
  end

  def test_it_can_create_keys
    @shift.stubs(:random_number).returns(12345)
    expected = {
      "A key" => 12,
      "B key" => 23,
      "C key" => 34,
      "D key" => 45
      }
    assert_equal expected, @shift.key_pairs
    assert_equal 12, @shift.key_pairs["A key"]
    assert_equal 4, @shift.key_pairs.count
  end

  def test_it_can_return_todays_date_in_appropriate_format
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    assert_equal "060620", @shift.todays_date
  end

  def test_it_can_square_given_date
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    assert_equal 3674784400, @shift.square_date 
  end
end
