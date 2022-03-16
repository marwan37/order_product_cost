
# Generate UUID in the following format: 8-4-4-4-12
def gen_uuid
  numbers = (0..9).to_a
  letters = ('a'..'f').to_a
  hexadecimals = (numbers << letters).flatten

  uuid = ""
  32.times do
    g = hexadecimals.sample
    uuid << g.to_s
  end
  print "#{uuid[0..7]}-#{uuid[8..11]}-#{uuid[12..15]}-#{uuid[16..19]}-#{uuid[20..31]}"
end

# LS solution
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
