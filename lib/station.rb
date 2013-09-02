class Station

	def initialize(name,list_of_bikes)
		@name = name
		@list_of_bikes = list_of_bikes
	end

	def name
    return @name
	end

  def list_of_bikes
    return @list_of_bikes
  end  

  def bike_available?
    @num_bikes_available = @list_of_bikes.select {|serial, availability| availability == 'Available'}
		@num_bikes_available.length > 0
  end

	def rent_out_a_bike
    if bike_available?
    	 @serial_number = serial_num
       remove_bike_from_list(@serial_num)
       @serial_num
    end
  end

  def serial_num
     @bikes = @list_of_bikes.select {|serial, availability| availability == 'Available'}
	   @serial_num = @bikes.first[0]
	   @serial_num
  end
	
	def remove_bike_from_list(serial_num)
    @list_of_bikes.delete(serial_num)
	end

	def bike_unavailable(serial_num)
     @list_of_bikes[serial_num] = "Not Available"
	end

end