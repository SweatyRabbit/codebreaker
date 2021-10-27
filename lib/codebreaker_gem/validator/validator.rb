# frozen_string_literal: true

module Validator
  def validate_guess_input_length(string, max_length, min_length)
    raise Error::MaxStringLength if string.length > max_length || string.length < min_length
  end

  def validate_string_not_empty(string)
    raise Error::EmptyString if string.empty?
  end

  def validate_input_class(object, expected_class)
    raise Error::WrongClass unless object.is_a?(expected_class)
  end

  def validate_input_only_numbers(input)
    raise Error::OnlyNumbers unless input.scan(/\D/)
  end

  def validate_range_input(input, range)
    input.each { |number| return raise Error::InputRange unless range.include?(number) }
  end

  def validate_name_length(name, min_length, max_length)
    raise Error::NameLength if name.length < min_length || name.length > max_length
  end
end
