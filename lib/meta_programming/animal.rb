# frozen_string_literal: true

def new_animal(diet, awake)
  animal = Object.new

  if diet == :meet
    animal.extend Carnivore
  else
    animal.extend Herbivore
  end

  if awake == :day
    animal.extend Diurnal
  else
    animal.extend Nocturnal
  end

  animal
end
