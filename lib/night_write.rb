require_relative 'convert'
input_file = ARGV[0]
output_file = ARGV[1]
message = File.read(input_file)
braille = Convert.to_braille(message)

File.write(output_file, braille)

puts "Created '#{output_file}' containing #{message.chars.count} characters"
