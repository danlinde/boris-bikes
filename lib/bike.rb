class Bike

	attr_reader :serial_number, :good_working_order
    attr_accessor :broken, :fixed

	def initialize(serial_number)
		@serial_number = serial_number
		@good_working_order = true
	end

	def serial_number
		@serial_number
	end

	def broken
		@good_working_order = false
	end

	def fixed
		@good_working_order = true
	end
end