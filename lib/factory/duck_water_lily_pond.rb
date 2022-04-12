# frozen_string_literal: true

class DuckWaterLilyPond < Habitat
  TYPES = {
    animal: Duck,
    plant: WaterLily
  }.freeze

  def new_organism(type, name)
    TYPES.fetch(type).new name
  rescue KeyError
    raise "Unknown organism type: #{type}"
  end
end
