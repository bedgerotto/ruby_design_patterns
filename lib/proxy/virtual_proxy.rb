# frozen_string_literal: true

class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def respond_to_missing?(method_name, *_args)
    subject.respond_to? method_name
  end

  def method_missing(method_name, *args)
    subject.public_send(method_name, *args)
  end

  def subject
    @subject ||= @creation_block.call
  end
end
