require_relative 'convert_braille'
input_file = ARGV[0]
output_file = ARGV[1]
braille = File.read(input_file)
message = ConvertBraille.to_text(braille)

File.write(output_file, message)

puts "Created '#{output_file}' containing #{message.chars.count} characters"
