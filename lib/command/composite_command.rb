# frozen_string_literal: true

class CompositeCommand < Command
  def initialize
    super("Commands composite")

    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute
    @commands.each(&:execute)
  end

  def unexecute
    @commands.reverse.each(&:unexecute)
  end

  def description
    @commands.inject("") do |memo, cmd|
      "#{memo}#{cmd.description} \n"
    end
  end
end
