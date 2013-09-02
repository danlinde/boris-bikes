class Station

	def initialize(name,list_of_bikes)
		@name = name
		@list_of_bikes = list_of_bikes
	end

	def number_of_bikes_available
		number_of_bikes_available = @list_of_bikes.select {|serial, availability| availability == 'Available'}
		number_of_bikes_available.length
	end

	def name
    return @name
	end

  def list_of_bikes
    return @list_of_bikes
  end  

	def rent_a_bike?
	   true
	end

end