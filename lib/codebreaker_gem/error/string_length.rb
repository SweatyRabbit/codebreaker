# frozen_string_literal: true

module CodebreakerGem
  module Error
    class MaxStringLength < StandardError
      STANDARD_MESSAGE = 'Length must be 4 digits code'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
