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
end
