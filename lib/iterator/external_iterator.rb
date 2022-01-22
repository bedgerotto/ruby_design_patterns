# frozen_string_literal: true

class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end
