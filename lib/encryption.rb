class Encryption
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
    @shift = Shifts.new
  end

  def indexed_alphabet
    index_to_letter = @character_set.group_by do |letter|
      @character_set.index(letter)
    end

    index_to_letter.transform_values! do |value|
      value.join
    end
  end

  def encrypt_message(message, keys = @shift.keys , offsets = @shift.offsets)  ## zip method  Hash[collection.zip(collection)] returns hash assignment
    hard_code_shifts = {
      "A shift" => 3,
      "B shift" => 27,
      "C shift" => 73,
      "D shift" => 20
    }
    # message = message.split(//).to_a
    keys = [1, 2, 3]
    
    index_to_letter = letter_to_index.invert
    require "pry"; binding.pry

    message.each_char.with_index do |letter, i|
      require "pry"; binding.pry
      key = keys
    end





    #
    # grouped_elements = {
    #   "1" => [],
    #   "2" => [],
    #   "3" => [],
    #   "4" => []
    # }
    # message.reduce(grouped_elements) do |acc, letter|
    #   if message.rindex(letter) % 4 == 0
    #     acc["4"] << letter
    #   elsif message.rindex(letter) % 3 == 0
    #     acc["3"] << letter
    #   elsif message.rindex(letter) % 2 == 0
    #     acc["2"] << letter
    #   else
    #     acc["1"] << letter
    #   end
    #   acc
    # end
    # require "pry"; binding.pry
  end










  #
  #   encrypted_message = []
  #   message.each do |letter|
  #     if @character_set.rindex(letter) + @shift.shifts["A shift"] > 27
  #       require "pry"; binding.pry
  #       encrypted_message << @character_set[(@character_set.rindex(letter) + @shift.shifts["A shift"]) % 27]
  #     else
  #       encrypted_message << @character_set[@character_set.rindex(letter) + @shift.shifts["A shift"]]
  #     end
  #   end
  # end
end
