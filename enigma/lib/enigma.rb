# class Enigma
#
#   def initialize
#     @key = Random.rand(0..99999)
#   end
# end

characters = []
characters << ("a".."z").to_a
characters << (0..9).to_a
characters << " "
characters << "."
characters << ","
characters = characters.flatten
indices = []
indices = (0..38).to_a.flatten
characters.map do |character|
  character.to_s
end
characters_and_indices = characters.zip(indices)


p characters_and_indices
