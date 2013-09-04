class CucumberStation
	def rent_bike
	   "{'s-abc-as' => 'available'}"
	end
end

Given /^a station with available bikes$/ do
  @station = CucumberStation.new
end
When /^I request to rent a bike$/ do 
  @bike = @station.rent_bike
end

Then /^I am given a bike$/ do 
  @bike.should == "{'s-abc-as' => 'available'}"
end

