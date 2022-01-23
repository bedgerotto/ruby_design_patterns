# frozen_string_literal: true

class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
    @target_content = ""
  end

  def execute
    @target_content = File.read(@target) if File.exist? @target

    FileUtils.copy @source, @target
  end

  def unexecute
    return unless File.exist? @target

    FileUtils.copy @target, @source
    if @target_content.strip.empty?
      File.delete @target
    else
      File.write(@target, @target_content)
    end
  end
end
