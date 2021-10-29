# frozen_string_literal: true

module CodebreakerGem
  class Statistic
    attr_reader :name, :difficulty, :attempts, :hints

    def initialize(name:, difficulty:, attempts:, hints:)
      @name = name
      @difficulty = difficulty
      @attempts = attempts
      @hints = hints
    end
  end
end
