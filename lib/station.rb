require_relative './van'
require_relative './bike'

class Station

  attr_reader :working_order, :bike 

	def initialize(name, capacity)
		@name = name
		@list_of_bikes = []
		@number_of_spaces_needed_for_repaired_bikes = 0
		@capacity = capacity
	end

	def name
    return @name
	end

	def list_of_bikes
    @list_of_bikes
	end

	def new_stock 
		(@capacity/2).times { @list_of_bikes << Bike.new }
	end

	def number_of_bikes_available
		bikes_available.length
	end

  def bikes_available
  	@list_of_bikes.select { |bike| bike.working_order == true }
  end

  def bikes_available?
  	true if bikes_available
  end

	def rent_out_a_bike
		@bike = bikes_available.last
		remove_bike_from_list(bikes_available.last)
    return @bike
	end

	def remove_bike_from_list(bike)
    @list_of_bikes.delete(bike)
	end

	def bike_broken
    @bike.broken
	end

	def space_available
		(@capacity - @list_of_bikes.length) > 0
	end

	def accept_bike(bike)
		@list_of_bikes << @bike if space_available
	end

	def broken_bikes
		@list_of_bikes.select {|bike| bike.working_order == false}
	end

	def load_van(van)
		van.accept_broken_bikes(broken_bikes)
  end

  def unload_van(van)
    update_list_of_bikes(van.fixed_bikes)
  end

  def update_list_of_bikes(van_list)

	 	# @list_of_bikes.each do |x|
	  #   van_list.each do |y| 
   #      x.working_order = true if x.serial_number == van_list[y].serial_number
   #    end
   #  end
  end
end


