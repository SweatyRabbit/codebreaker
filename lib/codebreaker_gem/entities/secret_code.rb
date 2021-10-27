# frozen_string_literal: true

class SecretCode
  MAX_CODE_LENGTH = 4
  MIN_VALUE = 1
  MAX_VALUE = 6

  def generate_secret_code
    Array.new(MAX_CODE_LENGTH) { rand(MIN_VALUE..MAX_VALUE) }
  end
end
