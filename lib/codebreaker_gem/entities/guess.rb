# frozen_string_literal: true

class Guess
  include Validator
  attr_reader :digit

  MAX_INPUT = 4
  INPUT_RANGE = (1..6).freeze

  def initialize(digit)
    @digit = digit
    validate
  end

  def parse_code
    @digit.chars.map { |number| Integer(number) }
  end

  private

  def validate
    validate_input_only_numbers(digit)
    validate_guess_input_length(parse_code, MAX_INPUT, MAX_INPUT)
    validate_range_input(parse_code, INPUT_RANGE)
  end
end
