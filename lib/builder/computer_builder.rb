# frozen_string_literal: true

class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def turbo
    @computer.motherboard.cpu = TurboCPU.new
  end

  def memory_size=(memory_size)
    @computer.memory_size = memory_size
  end

  def computer
    raise "Not enough memory" if @computer.motherboard.memory_size < 250
    raise "Too many drives" if @computer.drives.size > 4

    hard_disk = @computer.drives.find { |drive| drive.type == :hard_disk }
    raise "No hard disk." unless hard_disk

    @computer
  end

  def reset
    @computer = self.class.new
  end
end
