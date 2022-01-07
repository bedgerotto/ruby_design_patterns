# frozen_string_literal: true

class MakeCakeTask < CompositeTask
  def initialize
    super "Make Cake"
    self << MakeBatterTask.new
    self << FillPanTask.new
    self << BakeTask.new
    self << FrostTask.new
    self << LickSpoonTask.new
  end
end
