# frozen_string_literal: true

module CodebreakerGem
  module Error
    class OnlyNumbers < StandardError
      STANDARD_MESSAGE = 'Input must contain only numbers'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
