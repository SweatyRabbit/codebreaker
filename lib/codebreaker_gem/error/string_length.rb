# frozen_string_literal: true

module CodebreakerGem
  module Error
    class MaxStringLength < StandardError
      STANDARD_MESSAGE = 'Length must be from 1 to 4'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
