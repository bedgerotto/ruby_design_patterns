# frozen_string_literal: true

class FrogPond < Habitat
  def new_animal(name)
    Frog.new name
  end
end
