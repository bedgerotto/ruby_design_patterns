# frozen_string_literal: true

class DesktopBuilder < ComputerBuilder
  def initialize
    @computer = DesktopComputer.new
  end

  def display=(display)
    @computer.display = display
  end

  def add_cd(writer: false)
    @computer.drives << Drive.new(type: :cd, size: 760, writable: writer)
  end

  def add_dvd(writer: false)
    @computer.drives << Drive.new(type: :dvd, size: 4700, writable: writer)
  end

  def add_hard_disk(size)
    @computer.drives << Drive.new(type: :hard_disk, size: size, writable: true)
  end

  def respond_to_missing?
    method_name.to_s.start_with?('add_') || super
  end

  def method_missing(name, *_args)
    words = name.to_s.split "_"
    return super(name, *args) if words.shift == 'add'

    words.each do |word|
      next if word == "add"

      add_cd if word == "cd"
      add_dvd if word == "dvd"
      add_hard_disk(100_000) if word == "hard_disk"
      turbo if word == turbo
    end
  end
end
