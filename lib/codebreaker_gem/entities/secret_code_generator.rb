# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class SecretCodeGenerator
      MAX_CODE_LENGTH = 4
      MIN_VALUE = 1
      MAX_VALUE = 6

      def call
        Array.new(MAX_CODE_LENGTH) { rand(MIN_VALUE..MAX_VALUE) }
      end
    end
  end
end
