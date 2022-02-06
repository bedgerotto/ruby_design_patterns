# frozen_string_literal: true

class CheckSummingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte { |byte| @check_sum = (@check_sum + byte) % 256 }
    @check_sum += "\n".bytes[0] % 256

    @real_writer.write_line line
  end
end
