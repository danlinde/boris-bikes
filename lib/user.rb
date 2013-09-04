require_relative './station'

class User
attr_reader :username, :bike

	def initialize(username, bike={})
	  @username = username
	  @bike = bike
	end

    def can_rent_a_bike?(station)
      station.bike_available
    end

    def rent_a_bike(station)
      @bike = station.rent_out_a_bike
      @bike
    end

	def can_return_a_bike?(station)
	  station.space_available
	end
    
    def return_a_bike(station)
      @bike = {} if station.accept_bike(@bike)  
    end
end

