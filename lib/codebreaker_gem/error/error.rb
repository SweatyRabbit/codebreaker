# frozen_string_literal: true

module Error
  class DifficultyHandler < StandardError
    STANDARD_MESSAGE = 'Difficulty must be easy, medium or hell'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end

  class EmptyString < StandardError
    STANDARD_MESSAGE = 'Input cannot be empty'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end

  class InputRange < StandardError
    STANDARD_MESSAGE = 'Input must be between from 1 to 6'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end

  class MaxStringLength < StandardError
    STANDARD_MESSAGE = 'Length must be between from 1 to 4'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end

  class OnlyNumbers < StandardError
    STANDARD_MESSAGE = 'Input must contain only numbers'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end

  class NameLength < StandardError
    STANDARD_MESSAGE = 'Name length must be between from 3 to 20'

    def initialize(message = STANDARD_MESSAGE)
      super(message)
    end
  end
end
