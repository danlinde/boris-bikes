require_relative '../lib/user'

describe User do
	let(:user) {User.new}
  context 'when bikes available at station' do 
  	station_has_bikes = true
	  it "can rent a bike" do 
	  	expect(user.rents_a_bike?(station_has_bikes)).to be_true
	  end  
	end
  context 'when bikes unavailable at station' do 
  	station_has_bikes = false
	  it "cannot rent a bike" do 
	  	expect(user.rents_a_bike?(station_has_bikes)).to be_false
	  end
	end

	context "when space available at station" do 
		station_space_available = true
		it "can return bike" do 
			expect(user.returns_a_bike?(station_space_available)).to be_true
		end
	end

	context 'when space unavailable at station' do 
		station_space_available = false 
		it "cannot return bike" do 
			expect(user.returns_a_bike?(station_space_available)).to be_false
		end
	end
end