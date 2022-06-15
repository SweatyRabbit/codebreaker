# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class Statistic
      attr_reader :name, :difficulty, :attempts, :hints, :date

      def initialize(name:, difficulty:, attempts:, hints:)
        @name = name
        @difficulty = difficulty
        @attempts = attempts
        @hints = hints
        @date = DateTime.now
      end
    end
  end
end
