# frozen_string_literal: true

class Looper
  class << self
    def for_each_element(collection)
      i = 0
      while i < collection.length
        yield(collection[i])
        i += 1
      end
    end
  end
end
