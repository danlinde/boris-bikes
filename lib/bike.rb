class Bike

	attr_reader :serial_number
    attr_accessor :broken, :fixed, :working_order

	def initialize
		@serial_number = set_serial_number
		@working_order = 'working'
	end

	def set_serial_number
    	@serial_number = "#{rand(10000)}-abc-#{rand(10000)}"
	end

	def bike_details
		"{#{@serial_number} => #{@working_order}}"
	end

	def broken
	 	@working_order = 'broken'
	end

	def fixed
      @working_order = 'working'
	end
end