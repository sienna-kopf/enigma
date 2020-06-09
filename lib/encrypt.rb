require_relative './enigma'

message = File.open(ARGV[0]).read.chomp

enigma = Enigma.new

encrypted_message = enigma.encrypt(message)

open(ARGV[1], "w") do |f|
  f.puts encrypted_message[:encryption]
end

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
