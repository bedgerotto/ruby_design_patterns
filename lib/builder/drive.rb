# frozen_string_literal: true

class Drive
  attr_accessor :type, :size, :writable

  def initialize(type:, size:, writable:)
    @type = type
    @size = size
    @writable = writable
  end
end

class LaptopDrive < Drive; end
