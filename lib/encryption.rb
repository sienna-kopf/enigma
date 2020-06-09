require './modules/cryptable'

class Encryption
  include Cryptable
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end
end
