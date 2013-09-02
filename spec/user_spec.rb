require_relative '../lib/user'

describe User do
	let(:user) {User.new}
	let(:station) do 
	  double :station, 
	  'has_bikes?' => true, 
	  'has_no_bikes?' => false,
	  'has_space?' => true,
	  'has_no_space?' => false
	end 

  context 'when bikes available at station' do 
	  it "can rent a bike" do 
	  	expect(user.rents_a_bike?(station.has_bikes?)).to be_true
	  end  
	end
  context 'when bikes unavailable at station' do 
  	station_has_bikes = false
	  it "cannot rent a bike" do 
	  	expect(user.rents_a_bike?(station.has_no_bikes?)).to be_false
	  end
	end

	context "when space available at station" do 
		station_space_available = true
		it "can return bike" do 
			expect(user.returns_a_bike?(station.has_space?)).to be_true
		end
	end

	context 'when space unavailable at station' do 
		station_space_available = false 
		it "cannot return bike" do 
			expect(user.returns_a_bike?(station.has_no_space?)).to be_false
		end
	end
end