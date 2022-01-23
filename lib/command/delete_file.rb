# frozen_string_literal: true

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    @contents = File.read(@path) if File.exist?(@path)

    File.delete @path
  end

  def unexecute
    return if @contents.strip.empty?

    f = File.open(@path, "w")
    f.write @contents
    f.close
  end
end
