# frozen_string_literal: true

module CodebreakerGem
  module Entities
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
        validate_input_class(name, String)
        validate_name_length(name, STRING_MIN_LEGTH, STRING_MAX_LENGTH)
      end
    end
  end
end
