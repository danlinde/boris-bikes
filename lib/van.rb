require_relative './station'

class Van

  def initialize(name)	
    @name = name
  end

  def name
    @name
  end

  def accept_broken_bikes(station)
  	station.broken_bikes
  end

  def accept_fixed_bikes(garage)
  	 @fixed_bikes = garage.fixed_bikes
  end

  def deliver_fixed_bikes(station)
  	station.unload_van
  end

  def deliver_broken_bikes(garage)
  	@broken_bikes = garage.unload_van
  end
end
