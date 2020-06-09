module Cryptable

  def index_to_alphabet
    index_to_letter = @character_set.group_by do |letter|
      @character_set.index(letter)
    end

    index_to_letter.transform_values! do |value|
      value.join
    end
  end

  def alphabet_to_index
    index_to_alphabet.invert
  end

  def crypt_message(message, shifts)
    crypted_message = ""

    message.downcase.each_char.with_index do |character, i|
      if @character_set.include?(character)
        key = shifts[i % shifts.length]
        alphabet_index = alphabet_to_index[character]

        if (alphabet_index + key) < 27
          crypted_message << index_to_alphabet[alphabet_index + key]
        else
          crypted_message << index_to_alphabet[(alphabet_index + key) % 27]
        end
      else
        crypted_message << character
      end
    end
    crypted_message
  end
end
