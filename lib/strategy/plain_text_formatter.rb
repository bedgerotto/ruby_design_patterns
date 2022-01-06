# frozen_string_literal: true

PlainTextFormatter = lambda do |context|
  puts("***** #{context.title} *****")
  context.text.each do |line|
    puts(line)
  end
end
