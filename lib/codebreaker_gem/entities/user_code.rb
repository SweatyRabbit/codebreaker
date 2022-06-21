# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class UserCode
      STRONG_NUMBER = '+'
      SOFT_NUMBER = '-'
      WRONG_NUMBER = 'X'

      def initialize(secret_code, guess_code)
        @secret_code = secret_code.clone
        @guess_code = guess_code.clone
        @user_result = ''
      end

      def match
        strong_match
        soft_match
        wrong_match
        @user_result.dup
      end

      private

      def strong_match
        @guess_code.each_index do |index|
          next unless @secret_code[index] == @guess_code[index]

          @user_result += STRONG_NUMBER
          @secret_code[index] = nil
          @guess_code[index] = nil
        end
      end

      def soft_match
        @guess_code.delete(nil)
        @guess_code.each do |number|
          if @secret_code.include?(number)
            @user_result += SOFT_NUMBER
            @secret_code.delete(number)
          end
        end
      end

      def wrong_match
        (CodebreakerGem::Entities::Guess::MAX_INPUT - @user_result.size).times { @user_result << WRONG_NUMBER }
      end
    end
  end
end
