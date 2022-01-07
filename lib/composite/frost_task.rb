# frozen_string_literal: true

class FrostTask < Task
  def initialize
    super "Frost the baked cake"
  end

  def time_required
    10.0
  end
end
