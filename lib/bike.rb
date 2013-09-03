class Bike

	attr_reader :serial_number, :good_working_order, :break
	attr_accessor 

	def initialize(serial_number)
		@serial_number = serial_number
		@good_working_order = true
	end

	def serial_number
		@serial_number
	end

	def break
		@good_working_order = false
	end

	# def good_working_order?


end