# frozen_string_literal: true

class FillPanTask < Task
  def initialize
    super "Fill pan"
  end

  def time_required
    2.0
  end
end
