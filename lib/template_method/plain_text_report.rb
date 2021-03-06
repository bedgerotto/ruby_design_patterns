# frozen_string_literal: true

class PlainTextReport < Report
  def output_start; end

  def output_head
    puts("**** #{@title} ****")
    puts
  end

  def output_line(line)
    puts(line)
  end
end
