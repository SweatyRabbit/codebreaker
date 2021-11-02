# frozen_string_literal: true

module CodebreakerGem
  module Error
    class DifficultyHandler < StandardError
      STANDARD_MESSAGE = 'Difficulty must be easy, medium or hell'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
