# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class Guess
      include Validator
      attr_reader :digit

      MAX_INPUT = 4
      MIN_RANGE = 1
      MAX_RANGE = 6
      INPUT_RANGE = (MIN_RANGE..MAX_RANGE).freeze

      def initialize(digit)
        @digit = digit
        validate
      end

      def parse_code
        @digit.chars.map(&:to_i)
      end

      private

      def validate
        validate_input_only_numbers(digit)
        validate_guess_input_length(parse_code, MAX_INPUT, MAX_INPUT)
        validate_range_input(parse_code, INPUT_RANGE)
      end
    end
  end
end
