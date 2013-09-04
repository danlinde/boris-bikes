require_relative './van'
require_relative './bike'

class Station

  attr_reader :serial_num, :list_of_bikes, :bike_available, :num_bikes_available, :working_order 
  attr_accessor :user_bike

	def initialize(name, capacity)
		@name = name
		@list_of_bikes = []
		@capacity = capacity
	end

	def name
    return @name
	end

	def new_stock 
		(@capacity/2).times { @list_of_bikes << Bike.new }
	end 

  def bike_available
    @num_bikes_available = @list_of_bikes.select { |bike| bike.working_order == 'working' }
		@num_bikes_available.length > 0
  end

	def rent_out_a_bike
	  @bike = set_user_bike  
    remove_bike_from_list(@bike)
    @user_bike
  end

  def set_user_bike
  	@num_bikes_available = @list_of_bikes.select { |bike| bike.working_order == 'working' }
  	@user_bike = @num_bikes_available[0]
  end
	
	def remove_bike_from_list(bike)
    @list_of_bikes.delete(bike)
	end

	def bike_broken
     @user_bike.working_order = 'broken'
	end

	def space_available
		(@capacity - @list_of_bikes.length) > 0
	end

	def accept_bike(bike)
		@list_of_bikes << bike if space_available
		# @list_of_bikes.merge!(bike) if space_available
	end

	def broken_bikes
		@list_of_bikes.select {|bike| bike.working_order == 'broken'}
	end

	def load_van(van)
		van.accept_broken_bikes(broken_bikes)
		@list_of_bikes = @list_of_bikes.each {|bike| bike.working_order = 'garage' if bike.working_order == 'broken'}
    # @list_of_bikes.each { |key, value| @list_of_bikes[key] = 'garage' if value == 'broken'}
  end

  def unload_van(van)
  	van.fixed_bikes
  	@list_of_bikes = @list_of_bikes.each {|bike| bike.working_order = 'working' if bike.working_order == 'garage'}
    # @list_of_bikes = @list_of_bikes.each {|key, value| @list_of_bikes[key] = 'available' if value == 'garage'}
   end
end


