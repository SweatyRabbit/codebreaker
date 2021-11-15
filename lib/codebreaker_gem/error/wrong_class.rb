# frozen_string_literal: true

module CodebreakerGem
  module Error
    class WrongClass < StandardError
      STANDARD_MESSAGE = 'Input is not the same class'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
