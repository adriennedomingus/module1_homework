require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'crack'

class Enigma < Encrypt

  def initialize(message, key = Random.rand(0..99999).to_s, date = Time.now.strftime("%d%m%y").to_i)
    @message = message
    @key = key
    @date = date
  end

  def encrypt(message)
    Encrypt.new(@message, @key, @date).encrypt(message)
  end

  def decrypt(message)
    Decrypt.new(@message, @key, @date).decrypt(message)
  end

  def crack(message)
    Crack.new(@message, @date).crack(message)
  end

end
