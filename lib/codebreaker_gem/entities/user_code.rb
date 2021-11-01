# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class UserCode
      STRONG_NUMBER = '+'
      SOFT_NUMBER = '-'

      def initialize(secret_code, guess_code)
        @secret_code = secret_code
        @guess_code = guess_code
        @user_result = ''
      end

      def match
        guess_code = @guess_code.clone
        secret_code = @secret_code.clone
        strong_match(secret_code, guess_code)
        soft_match(secret_code, guess_code)
        @user_result
      end

      private

      def strong_match(secret_code, guess_code)
        guess_code.each_index do |index|
          next unless secret_code[index] == guess_code[index]

          @user_result += STRONG_NUMBER
          secret_code[index] = nil
          guess_code[index] = nil
        end
      end

      def soft_match(secret_code, guess_code)
        guess_code.delete(nil)
        guess_code.each do |number|
          if secret_code.include?(number)
            @user_result += SOFT_NUMBER
            secret_code.delete(number)
          end
        end
      end
    end
  end
end
