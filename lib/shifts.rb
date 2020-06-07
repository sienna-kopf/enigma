class Shifts
  attr_reader :a_shift,
                :b_shift,
                :c_shift,
                :d_shift

    def initialize(shifts)
      @a_shift = shifts["A"]
      @b_shift = shifts["B"]
      @c_shift = shifts["C"]
      @d_shift = shifts["D"]
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
end
