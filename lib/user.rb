require 'station'

class User
attr_reader :username, :bike

	def initialize(username)
		@username = username
		@bike = []
	end

    def can_rent_a_bike?(station)
    	station.bike_available
    end

    def rent_a_bike(station)
       @bike = station.rent_out_a_bike
    end

	def can_return_a_bike?(station)
		station.space_available
	end
    
    def return_a_bike(station)
    	@bike = [] if station.accept_a_bike  
    end


end

