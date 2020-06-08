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

  def alphabet_to_index
    indexed_alphabet.invert
  end

  def encrypt_message(message, keys = @shift.keys , offsets = @shift.offsets)  ## zip method  Hash[collection.zip(collection)] returns hash assignment
    encrypted_message = ""
    shifts = [3, 27, 73, 20]

    message.downcase.each_char.with_index do |letter, i|
      key = shifts[i % shifts.length]
      alphabet_index = alphabet_to_index[letter]

      if (alphabet_index + key) < 27
        encrypted_message << indexed_alphabet[alphabet_index + key]
      else
        encrypted_message << indexed_alphabet[(alphabet_index + key) % 27]
      end
      encrypted_message
    end
    require "pry"; binding.pry
  end
end
