require 'station'

class Van

attr_reader :name

  def initialize(name)	
    @name = name
  end

  def accept_broken_bikes(station)
  	station.broken_bikes
  end

  def accept_fixed_bikes(garage)
  	garage.fixed_bikes
  end

  def deliver_fixed_bikes(station)
  	station.unload_van
  end

  def deliver_broken_bikes(garage)
  	garage.unload_van
  end

end
