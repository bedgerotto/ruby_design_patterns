# frozen_string_literal: true

require 'net/http'

class HttpAdapter
  def send_message(message)
    puts "Triggering request http request to: #{message.to.host}"
    puts "Message: #{message.body}"
    # Net::HTTP.start(message.to.host, message.to.port) do |http|
    #   http.post(message.to.path, message.body)
    # end
  end
end
