# frozen_string_literal: true

class MakeBatterTask < CompositeTask
  def initialize
    super "Make batter"
    self << AddDryIngredientsTask.new
    self << AddLiquidsTask.new
    self << MixTask.new
  end
end
