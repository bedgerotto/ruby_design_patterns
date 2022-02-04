# frozen_string_literal: true

class AccountProxy
  def initialize(subject)
    @subject = subject
  end

  def respond_to_missing?(method_name, *_args)
    @subject.respond_to? method_name
  end

  def method_missing(method_name, *args)
    puts "Delegating #{method_name} message to subject"
    @subject.send(method_name, *args)
  end
end
