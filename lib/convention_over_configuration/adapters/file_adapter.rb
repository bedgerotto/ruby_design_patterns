# frozen_string_literal: true

class FileAdapter
  def send_message(message)
    puts "Writting down to file: #{message.to.host}"
    puts "Message: #{message.body}"
    # to_path = message.to.path
    # to_path.slice!(0)

    # File.open(to_path, 'w') do |f|
    #   f.write(message.body)
    # end
  end
end
