# frozen_string_literal: true

class PondOrganismFactory
  def new_animal(name)
    Duck.new name
  end

  def new_plant(name)
    Algae.new name
  end
end
