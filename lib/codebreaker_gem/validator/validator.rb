# frozen_string_literal: true
module CodebreakerGem
  module Validator
    def validate_guess_input_length(string, max_length, min_length)
      raise CodebreakerGem::Error::MaxStringLength if string.length > max_length || string.length < min_length
    end

    def validate_string_not_empty(string)
      raise CodebreakerGem::Error::EmptyString if string.empty?
    end

    def validate_input_class(object, expected_class)
      raise CodebreakerGem::Error::WrongClass unless object.is_a?(expected_class)
    end

    def validate_input_only_numbers(input)
      raise CodebreakerGem::Error::OnlyNumbers unless input.scan(/\D/)
    end

    def validate_range_input(input, range)
      input.each { |number| return raise CodebreakerGem::Error::InputRange unless range.include?(number) }
    end

    def validate_name_length(name, min_length, max_length)
      raise CodebreakerGem::Error::NameLength if name.length < min_length || name.length > max_length
    end
  end
end
