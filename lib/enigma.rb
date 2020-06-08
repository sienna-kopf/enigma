require_relative './encryption'
require_relative './shifts'

class Enigma

  def initialize
    @encryption = Encryption.new
    @shifts = Shifts.new
  end

  def encrypt(message, key, date)
    {
      :encryption => @encryption.encrypt_message(message, @shifts.shifts(key, date)),
      :key => key,
      :date => date
    }
  end
end
