require_relative './van'

class Station

  attr_reader :serial_num, :list_of_bikes, :bike_available

	def initialize(name,list_of_bikes, capacity)
		@name = name
		@list_of_bikes = list_of_bikes
		@capacity = capacity
	end

	def name
    return @name
	end

  def list_of_bikes
    return @list_of_bikes
  end  

  def bike_available
    @num_bikes_available = @list_of_bikes.select {|serial, availability| availability == 'available'}
		@num_bikes_available.length > 0
  end

	def rent_out_a_bike
	  @bike = bike  # this returned number needs to be stored somewhere
    remove_bike_from_list(@bike)
    @bike
  end

  def bike
    @all_bikes = @list_of_bikes.clone
    @bikes_available = @all_bikes.delete_if {|k, v| v != 'available'}
    @bike = Hash[*@bikes_available.first]
  end
	
	def remove_bike_from_list(serial_num)
    @list_of_bikes.delete(bike)
	end

	def broken(bike)
     @list_of_bikes[bike] = "broken"
	end

	def space_available
		(@capacity - @list_of_bikes.length) > 0
	end

	def accept_bike(bike)
		@list_of_bikes.merge!(bike) if space_available
	end

	def broken_bikes
		@list_of_bikes.select {|serial, availability| availability == 'broken'}
	end

	def load_van(van)
		van.accept_broken_bikes(broken_bikes)
    @list_of_bikes.each { |key, value| @list_of_bikes[key] = 'garage' if value == 'broken'}
  end

  def unload_van(van)
  	van.fixed_bikes
    @list_of_bikes = @list_of_bikes.each {|key, value| @list_of_bikes[key] = 'available' if value == 'garage'}
   end
end


