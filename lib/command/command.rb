# frozen_string_literal: true

class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execcute
    raise NotImplementedError, 'You must override this method'
  end
end
