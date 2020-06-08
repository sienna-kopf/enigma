require 'date'

class Shifts

    def initialize
      # @shifts = shifts
      @keys = keys
      @offsets = offsets
    end

    def random_number
      rand(99999)
    end

    def padded_random_number(number = random_number)
      sprintf("%05d", number)
    end

    def random_number_array(number = random_number)
      padded_random_number(number).split(//).to_a
    end

    def key_pairs_array(number = random_number)
      pairs_array = []
      random_number_array(number).each_cons(2) do |set|
        pairs_array << set
      end
      pairs_array
    end

    def keys(number = random_number)
      key_pairs_array(number).flat_map do |pair|
        pair.join.to_i
      end
    end

    def todays_date
      Date.today.strftime("%d%m%y")
    end

    def square_date(date = todays_date)
      date.to_i * date.to_i
    end

    def offsets(date = todays_date)
      square_date_array = square_date(date).to_s.split(//).to_a[-4..-1]
      square_date_array.map {|element| element.to_i}
    end

    def shifts
      {
        "A shift" => offsets["A offset"] + keys["A key"].to_i,
        "B shift" => offsets["B offset"] + keys["B key"].to_i,
        "C shift" => offsets["C offset"] + keys["C key"].to_i,
        "D shift" => offsets["D offset"] + keys["D key"].to_i
      }
    end
end
