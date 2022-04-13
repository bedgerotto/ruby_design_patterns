# frozen_string_literal: true

class Computer
  attr_accessor :display, :motherboard, :drives

  def initialize(display: :crt, motherboard: Motherboard.new, drives: [])
    @motherboard = motherboard
    @display = display
    @drives = drives
  end
end
