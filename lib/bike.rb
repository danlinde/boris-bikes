class Bike

  attr_reader :working_order
  attr_accessor :broken, :fixed

	def initialize
		@serial_number = set_serial_number
		@working_order = true
	end

  def serial_number
    @serial_number
  end
	def set_serial_number
    	@serial_number = "#{rand(10000)}-abc-#{rand(10000)}"
	end

	def bike_details
		"{#{@serial_number} => #{@working_order}}"
	end

	def working_order?
    @working_order
	end

	def broken
	 	@working_order = false
	end

	def fixed
     @working_order = true
	end
end