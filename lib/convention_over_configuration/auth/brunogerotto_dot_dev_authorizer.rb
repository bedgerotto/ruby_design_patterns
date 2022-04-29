# frozen_string_literal: true

class BrunogerottoDotDevAuthorizer
  def bruno_dot_gerotto_authorized?(_message)
    true
  end

  def authorized?(message)
    message.body.size < 10
  end
end
