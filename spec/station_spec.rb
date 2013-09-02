require_relative '../lib/station'

describe Station do 
  let(:station){Station.new('Pimlico', {'s-123-ab' => 'Available', 's-234-cd' => 'Not Available'})}
  it 'can referenced by name' do 
  	expect(station.name).to eq 'Pimlico'
  end

	it 'returns the number bikes available' do
	  expect(station.number_of_bikes_available()).to eq 1
	end

  it 'can rent a bike' do 
    expect(station.rent_a_bike?()).to be_true
  end

  it 'can create a list of bike details' do 
  	expect(station.list_of_bikes()).to eq({"s-123-ab"=>"Available", "s-234-cd"=>"Not Available"})
  end
end
