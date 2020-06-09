require './modules/cryptable'

class Decryption
  include Cryptable
  attr_reader :character_set

  def initialize
    @character_set = (("a".."z").to_a << " ").reverse
  end
end
