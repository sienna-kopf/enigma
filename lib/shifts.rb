require 'date'

class Shifts
  attr_reader :a_shift,
                :b_shift,
                :c_shift,
                :d_shift,
                :keys

    def initialize(shifts)
      @a_shift = shifts["A"]
      @b_shift = shifts["B"]
      @c_shift = shifts["C"]
      @d_shift = shifts["D"]
      @keys = keys
    end

    def random_number
      rand(99999)
    end

    def padded_random_number
      sprintf("%05d", random_number)
    end

    def random_number_array
      padded_random_number.split(//).to_a
    end

    def key_pairs_array
      pairs_array = []
      random_number_array.each_cons(2) do |set|
        pairs_array << set
      end
      pairs_array
    end

    def key_pairs
      @keys = {
        "A key" => key_pairs_array[0].join.to_i,
        "B key" => key_pairs_array[1].join.to_i,
        "C key" => key_pairs_array[2].join.to_i,
        "D key" => key_pairs_array[3].join.to_i
        }
    end

    def todays_date
      Date.today.strftime("%d%m%y")
    end

    def square_date
      todays_date.to_i * todays_date.to_i
    end

    def offsets
      square_date_array = square_date.to_s.split(//).to_a
      @offsets = {
        "A offset" => square_date_array[-4].to_i,
        "B offset" => square_date_array[-3].to_i,
        "C offset" => square_date_array[-2].to_i,
        "D offset" => square_date_array[-1].to_i
        }
    end

    def shifts
    end
end
