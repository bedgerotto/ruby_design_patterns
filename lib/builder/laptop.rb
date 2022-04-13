# frozen_string_literal: true

class LaptopComputer < Computer
  def initialize(motherboard: Motherboard.new, drives: [])
    super(display: :lcd, motherboard: motherboard, drives: drives)
  end
end
