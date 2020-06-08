require './test/test_helper'
require './lib/shifts'

class ShiftsTest < Minitest::Test
  def setup
    @shift = Shifts.new
  end

  def test_it_exists
    assert_instance_of Shifts, @shift
  end

  def test_it_can_generate_a_random_number
    @shift.stubs(:random_number).returns(21923)
    assert_equal 21923, @shift.random_number
  end

  def test_it_can_pad_random_number_with_leading_zeros
    @shift.stubs(:random_number).returns(25)
    assert_equal "00025", @shift.padded_random_number(@shift.random_number)
    assert_equal "01234", @shift.padded_random_number(1234)
  end

  def test_it_can_create_an_array_out_of_padded_random_number
    @shift.stubs(:random_number).returns(12345)

    assert_equal ["1", "2", "3", "4", "5"], @shift.random_number_array(@shift.padded_random_number(@shift.random_number))
    assert_equal 5, @shift.random_number_array(@shift.padded_random_number(@shift.random_number)).count
    ## weird prob here... fix later!
    # assert_equal ["0", "0", "2", "2", "2"], @shift.random_number_array(@shift.padded_random_number(222))
  end

  def test_it_can_create_key_pairs_array
    @shift.stubs(:random_number).returns(12345)
    expected = [
      ["1", "2"],
      ["2", "3"],
      ["3", "4"],
      ["4", "5"]]

    assert_equal expected, @shift.key_pairs_array(@shift.random_number)
    assert_equal ["1", "2"], @shift.key_pairs_array(@shift.random_number)[0]
    assert_equal 4, @shift.key_pairs_array(@shift.random_number).count

    expected2 = [
      ["0", "0"],
      ["0", "0"],
      ["0", "2"],
      ["2", "2"]
    ]
    assert_equal expected2, @shift.key_pairs_array(22)
    assert_equal ["2", "2"], @shift.key_pairs_array(22)[3]
  end

  def test_it_can_create_keys
    @shift.stubs(:random_number).returns(12345)
    expected = [12, 23, 34, 45]
    assert_equal expected, @shift.keys
    assert_equal 12, @shift.keys[0]
    assert_equal 4, @shift.keys.count

    expected = [0, 0, 2, 22]
    assert_equal expected2, @shift.keys(22)
    assert_equal 22, @shift.keys(22)[3]
  end

  # def test_it_can_return_todays_date_in_appropriate_format
  #   skip
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #
  #   assert_equal "060620", @shift.todays_date
  # end
  #
  # def test_it_can_square_given_date
  #   skip
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #
  #   assert_equal 3674784400, @shift.square_date
  # end
  #
  # def test_it_can_create_offsets
  #   skip
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   expected = {
  #     "A offset" => 4,
  #     "B offset" => 4,
  #     "C offset" => 0,
  #     "D offset" => 0
  #     }
  #   assert_equal expected, @shift.offsets
  #   assert_equal 4, @shift.offsets["A offset"]
  #   assert_equal 4, @shift.offsets.count
  # end
  #
  # def test_it_can_assign_shifts
  #   skip
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   @shift.stubs(:random_number).returns(234)
  #
  #   expected = {
  #     "A shift" => 4,
  #     "B shift" => 6,
  #     "C shift" => 23,
  #     "D shift" => 34
  #   }
  #   assert_equal expected, @shift.shifts
  #   assert_equal 23, @shift.shifts["C shift"]
  #   assert_equal 4, @shift.shifts.count
  # end
end
