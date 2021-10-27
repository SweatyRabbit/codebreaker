# frozen_string_literal: true

class User
  include Validator

  attr_reader :name

  STRING_MIN_LEGTH = 3
  STRING_MAX_LENGTH = 20

  def initialize(name)
    @name = name
    validate
  end

  private

  def validate
    validate_name_length(name, STRING_MIN_LEGTH, STRING_MAX_LENGTH)
    validate_input_class(name, String)
    validate_string_not_empty(name)
  end
end
