# frozen_string_literal: true

class AddLiquidsTask < Task
  def initialize
    super "Add liquid ingredients"
  end

  def time_required
    1.0
  end
end
