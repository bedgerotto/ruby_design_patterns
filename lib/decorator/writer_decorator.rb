# frozen_string_literal: true

class WriterDecorator
  def initialize(real_writer)
    @real_writer = real_writer
  end

  def write_line(line)
    @real_writer.write_line line
  end

  def pos
    @real_writer.pos
  end

  def rewind
    @pos.rewind
  end

  def close
    @real_writer.close
  end
end
