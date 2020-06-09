require_relative './enigma'

encrypted_message = File.open(ARGV[0]).read.chomp

enigma = Enigma.new

decrypted_message = enigma.decrypt(encrypted_message, ARGV[2].to_s, ARGV[3].to_s)

open(ARGV[1], "w") do |f|
  f.puts decrypted_message[:decryption]
end

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
