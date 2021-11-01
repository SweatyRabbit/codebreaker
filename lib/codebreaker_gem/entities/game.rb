# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class Game
      attr_reader :name, :level, :user_attempts, :user_hints, :secret_code, :guess

      def initialize(name, level)
        @name = CodebreakerGem::Entities::User.new(name)
        @level = CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level]
        @user_attempts = CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:attempts]
        @user_hints = CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:hints]
        @secret_code = CodebreakerGem::Entities::SecretCode.new.generate_secret_code
        @hint_code = @secret_code.sample(@user_hints)
      end

      def use_attempt(guess)
        return if lose? || win?

        @user_attempts -= 1
        @guess = CodebreakerGem::Entities::Guess.new(guess).parse_code
        code_match = CodebreakerGem::Entities::UserCode.new(@secret_code, @guess)
        code_match.match
      end

      def use_hint
        @user_hints -= 1
        @hint_code.pop
      end

      def win?
        @guess == @secret_code
      end

      def lose?
        @user_attempts.zero?
      end

      def current_statistic
        CodebreakerGem::Entities::Statistic.new(name: name,
                                                difficulty: @level[:level],
                                                attempts: @level[:attempts] - @user_attempts,
                                                hints: @level[:hints] - @user_hints)
      end

      def save_current_statistic
        store = CodebreakerGem::Entities::CodebreakerGemStore.new
        store.data[:users_statistic] << current_statistic
        store.save
      end

      def users_statistic
        store = CodebreakerGem::Entities::CodebreakerGemStore.new
        store.data[:users_statistic].sort_by { |stats| [stats.difficulty, stats.attempts, stats.hints] }
      end
    end
  end
end
