# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class Difficulty
      include Validator
      attr_reader :level, :attempts, :hints

      DIFFICULTIES = {
        easy: { level: 'Easy', attempts: 15, hints: 2 },
        medium: { level: 'Medium', attempts: 10, hints: 1 },
        hell: { level: 'Hell', attempts: 5, hints: 1 }
      }.freeze

      def <=>(other)
        [attempts, hints] <=> [other.attempts, other.hints]
      end

      def initialize(level)
        validate_difficulty(level)
        @level = level
        @attempts = DIFFICULTIES[@level][:attempts]
        @hints = DIFFICULTIES[@level][:hints]
      end
    end
  end
end
