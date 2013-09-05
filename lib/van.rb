require_relative './station'

class Van
  
  def initialize(name)	
    @name = name
    @list_of_broken_bikes = []
    @list_of_fixed_bikes = []
  end

  def name
    @name
  end
  
  def broken_bikes
    @list_of_broken_bikes
  end

  def fixed_bikes
    @list_of_fixed_bikes
  end

  def accept_broken_bikes(station)
  	@list_of_broken_bikes << station.broken_bikes
  end

  def accept_fixed_bikes(garage)
  	 @list_of_fixed_bikes << garage.fixed_bikes
  end

end
