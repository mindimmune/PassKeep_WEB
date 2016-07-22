require 'singleton'

class SiteSecurity::Cryptor
  include Singleton

  attr_reader :cryptor

  def initialize
    @cryptor = ActiveSupport::MessageEncryptor.new(ENV['ENCRYPTION_KEY'])
  end

  def encrypt_value(value)
    @cryptor.encrypt_and_sign(value)
  end

  def decrypt_value(value)
    @cryptor.decrypt_and_verify(value)
  end
end
