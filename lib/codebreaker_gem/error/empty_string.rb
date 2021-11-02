# frozen_string_literal: true

module CodebreakerGem
  module Error
    class EmptyString < StandardError
      STANDARD_MESSAGE = 'Input cannot be empty'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
