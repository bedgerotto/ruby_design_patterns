# frozen_string_literal: true

require "etc"

class AccountProtectionProxy
  def initialize(subject, owner)
    @subject = subject
    @owner = owner
  end

  def respond_to_missing?(method_name, *_args)
    @subject.respond_to? method_name
  end

  def method_missing(method_name, *args)
    check_access
    @subject.public_send(method_name, *args)
  end

  def check_access
    raise "Illegal access: #{Etc.getlogin} cannot access account" if Etc.getlogin != @owner
  end
end
