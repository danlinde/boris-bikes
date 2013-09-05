require_relative '../lib/user'

describe User do
	let(:user) {User.new('bob')} 

	it 'creates a user' do
		user = User.new('bob')
		expect(user.username).to eq 'bob'
	end

	it 'asks the station if there are bikes available' do
		station = double(:station, {:bike_available? => true})

		expect(user.can_rent_a_bike?(station)).to be_true
	end

  it 'cannot rent a bike if there are no bikes available' do
		station = double(:station, { :bike_available? => false })

		expect(user.can_rent_a_bike?(station)).to be_false
	end

  it 'asks the station to rent a bike' do
		station = double(:station)
		expect(station).to receive(:rent_out_a_bike)
		
		user.rent_a_bike(station)
	end


  it 'receives a bike' do
  	bike = double(:bike)
  	station = double(:station, {:rent_out_a_bike => bike})

  	expect(user.rent_a_bike(station)).to eq(bike)
  end

  it 'asks the station if there are spaces available' do 
  	station = double(:station, { :space_available => true })
  	expect(station).to receive(:space_available)

  	user.can_return_a_bike?(station)
  end

  it 'can return a bike if space available' do 
  	station = double(:station, { :space_available => true })
  	expect(user.can_return_a_bike?(station)).to be_true
  end

   it 'cannot return a bike if no space available' do 
  	station = double(:station, { :space_available => false })
  	expect(user.can_return_a_bike?(station)).to be_false
  end

  context 'has rented a bike' do 
	  
	  it 'asks the station to accept a bike' do
	  	user_with_bike = User.new('bob')
	  	station = double(:station, {:accept_bike => true})
	  	expect(station).to receive(:accept_bike)
	  	user_with_bike.return_a_bike(station)
	  end
    
    context 'returns a bike' do 
		  it 'and bike is removed from record' do
		  	user_with_bike = User.new('bob')
		  	bike = double :bike
		  	station = double(:station, {:accept_bike => bike})
		  	expect(user_with_bike.return_a_bike(station)).to eq nil
			end
		end
	end
end

