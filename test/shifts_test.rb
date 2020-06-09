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
    assert_equal true, @shift.random_number.to_s.length <= 5
    assert_equal true, @shift.random_number.class == Integer

    @shift.stubs(:random_number).returns(21923)
    assert_equal 21923, @shift.random_number
  end

  def test_it_can_pad_random_number_with_leading_zeros
    @shift.stubs(:random_number).returns(25)
    assert_equal "00025", @shift.padded_random_number(@shift.random_number)
    assert_equal true, @shift.padded_random_number(@shift.random_number).length == 5
    
    assert_equal "01234", @shift.padded_random_number(1234)
    assert_equal true, @shift.padded_random_number(1234).length == 5
  end

  def test_it_can_create_an_array_out_of_padded_random_number
    @shift.stubs(:random_number).returns(12345)

    assert_equal ["1", "2", "3", "4", "5"], @shift.random_number_array(@shift.padded_random_number(@shift.random_number))
    assert_equal 5, @shift.random_number_array(@shift.padded_random_number(@shift.random_number)).count
  end

  def test_it_can_create_key_pairs_array
    @shift.stubs(:random_number).returns(12345)
    expected = [
      ["1", "2"],
      ["2", "3"],
      ["3", "4"],
      ["4", "5"]
    ]

    assert_equal expected, @shift.key_pairs_array(@shift.random_number)
    assert_equal ["1", "2"], @shift.key_pairs_array(@shift.random_number)[0]
    assert_equal 4, @shift.key_pairs_array(@shift.random_number).count

    expected2 = [
      ["0", "0"],
      ["0", "0"],
      ["0", "2"],
      ["2", "2"]
    ]
    assert_equal expected2, @shift.key_pairs_array("00022")
    assert_equal ["2", "2"], @shift.key_pairs_array("00022")[3]
  end

  def test_it_can_create_keys
    @shift.stubs(:random_number).returns(12345)
    expected = [12, 23, 34, 45]
    assert_equal expected, @shift.keys
    assert_equal 12, @shift.keys[0]
    assert_equal 4, @shift.keys.count

    expected2 = [0, 0, 2, 22]
    assert_equal expected2, @shift.keys("00022")
    assert_equal 22, @shift.keys("00022")[3]
  end

  def test_it_can_return_todays_date_in_appropriate_format
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    assert_equal "060620", @shift.todays_date
  end

  def test_it_can_square_given_date
    Date.stubs(:today).returns(Date.new(2020, 06, 06))

    assert_equal 3674784400, @shift.square_date

    assert_equal 1672401025, @shift.square_date("040895")
  end

  def test_it_can_create_offsets
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    expected = [4, 4, 0, 0]
    assert_equal expected, @shift.offsets
    assert_equal 4, @shift.offsets[0]
    assert_equal 4, @shift.offsets.count

    expected2 = [1, 0, 2, 5]
    assert_equal expected2, @shift.offsets("040895")
    assert_equal 5, @shift.offsets("040895")[3]
  end

  def test_it_can_assign_shifts
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    @shift.stubs(:random_number).returns(234)

    expected = [4, 6, 23, 34]
    assert_equal expected, @shift.shifts
    assert_equal 23, @shift.shifts[2]
    assert_equal 4, @shift.shifts.count

    expected2 = [3, 27, 73, 20]
    assert_equal expected2, @shift.shifts("02715", "040895")
    assert_equal 73, @shift.shifts("02715", "040895")[2]

    expected3 = [6, 31, 71, 15]
    assert_equal expected3, @shift.shifts("02715")
    assert_equal 71, @shift.shifts("02715")[2]
  end
end
