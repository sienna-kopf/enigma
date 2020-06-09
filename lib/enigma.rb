require_relative './encryption'
require_relative './decryption'
require_relative './shifts'

class Enigma
  attr_reader :shifts

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
    @shifts = Shifts.new
  end

  def encrypt(message, key = @shifts.padded_number, date = @shifts.todays_date)
    {
      :encryption => @encryption.crypt_message(message, @shifts.shifts(key, date)),
      :key => key,
      :date => date
    }
  end

  def decrypt(message, key = @shifts.padded_number, date = @shifts.todays_date)
    {
      :decryption => @decryption.crypt_message(message, @shifts.shifts(key, date)),
      :key => key,
      :date => date
    }
  end
end
