# frozen_string_literal: true

class BakeTask < Task
  def initialize
    super "Bake the cake"
  end

  def time_required
    30.0
  end
end
