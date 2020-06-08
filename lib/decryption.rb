class Decryption
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
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
end
