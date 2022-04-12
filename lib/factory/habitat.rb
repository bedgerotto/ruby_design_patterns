# frozen_string_literal: true

class Habitat
  def initialize(number_animals, number_plants, organism_factory)
    @animals = number_animals.times.map do |i|
      organism_factory.new_animal "Animal#{i}"
    end

    @plants = number_plants.times.map do |i|
      organism_factory.new_plant "Plant#{i}"
    end
  end

  def simulate_one_day
    @plants.each(&:grow)
    @animals.each(&:speak)
    @animals.each(&:eat)
    @animals.each(&:sleep)
  end
end
