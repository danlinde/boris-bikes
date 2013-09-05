require_relative './van'
require_relative './bike'

class Garage

  def initialize
  	@list_of_broken_bikes = []
  	@list_of_fixed_bikes = []
  end

	def fixed_bikes
      @list_of_fixed_bikes 
	end

	def unload_van(van)
	  @list_of_broken_bikes << van.broken_bikes
	end

	def broken_bikes
    @list_of_broken_bikes
	end

	def fix!
		@list_of_fixed_bikes = @list_of_broken_bikes.each {|bike| bike.fixed}
	end 

end
