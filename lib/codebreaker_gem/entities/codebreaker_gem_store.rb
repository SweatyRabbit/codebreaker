# frozen_string_literal: true

module CodebreakerGem
  module Entities
    class CodebreakerGemStore
      STORAGE_DIRECTORY = 'db'
      STORAGE_FILE = 'database.yml'
      attr_accessor :data

      def initialize
        @data = db_initialized? ? load : initialize_db
      end

      def save
        storage = YAML::Store.new(path)
        storage.transaction do
          data.each { |key, value| storage[key] = value }
        end
      end

      private

      def load
        storage = YAML::Store.new(path)
        storage.transaction do
          storage.roots.to_h { |key| [key, storage[key]] }
        end
      end

      def initialize_db
        Dir.mkdir(File.join(STORAGE_DIRECTORY))
        standard_data
      end

      def path
        File.join(STORAGE_DIRECTORY, STORAGE_FILE)
      end

      def db_initialized?
        File.exist?(path)
      end

      def standard_data
        {
          users_statistic: []
        }
      end
    end
  end
end
