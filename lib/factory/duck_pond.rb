# frozen_string_literal: true

class DuckPond < Habitat
  def new_animal(name)
    Duck.new name
  end
end
