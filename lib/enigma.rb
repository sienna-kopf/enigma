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

  def encrypt(message, key = @shifts.padded_random_number, date = @shifts.todays_date)
    {
      :encryption => @encryption.encrypt_message(message, @shifts.shifts(key, date)),
      :key => key,
      :date => date
    }
  end

  def decrypt(message, key = @shifts.padded_random_number, date = @shifts.todays_date)
    {
      :decryption => @decryption.decrypt_message(message, @shifts.shifts(key, date)),
      :key => key,
      :date => date
    }
  end
end
