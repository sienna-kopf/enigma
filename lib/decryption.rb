class Decryption
  attr_reader :character_set

  def initialize
    @character_set = (("a".."z").to_a << " ").reverse
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

  def decrypt_message(encrypted_message, shifts)
    decrypted_message = ""

    encrypted_message.downcase.each_char.with_index do |character, i|
      if @character_set.include?(character)
        key = shifts[i % shifts.length]
        alphabet_index = alphabet_to_index[character]

        if (alphabet_index + key) < 27
          decrypted_message << indexed_alphabet[alphabet_index + key]
        else
          decrypted_message << indexed_alphabet[(alphabet_index + key) % 27]
        end
      else
        decrypted_message << character
      end
    end
    decrypted_message
  end
end
