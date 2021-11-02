# frozen_string_literal: true

module CodebreakerGem
  module Error
    class NameLength < StandardError
      STANDARD_MESSAGE = 'Name length must be from 3 to 20'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
