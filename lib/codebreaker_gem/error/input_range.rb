# frozen_string_literal: true

module CodebreakerGem
  module Error
    class InputRange < StandardError
      STANDARD_MESSAGE = 'Input must be from 1 to 6'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
