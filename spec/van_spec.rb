require_relative '../lib/van'

describe Van do
	let(:van) {Van.new('rodney')}

	it 'can be created' do
		van = Van.new('cecil')
		expect(van.name).to eq 'cecil'
	end

	it 'can accept broken bikes from a station' do
		station = double :station
		expect(station).to receive (:broken_bikes)

		van.accept_broken_bikes(station)
	end

	it 'can accept fixed bikes from garage' do
		garage = double :garage
		expect(garage).to receive (:fixed_bikes)

		van.accept_fixed_bikes(garage)
	end

	it 'can deliver fixed bikes to station' do 
		station = double :station
		expect(station).to receive (:unload_van)

		van.deliver_fixed_bikes(station)
  end

  it 'can deliver broken bikes to garage' do 
    garage = double :garage
		expect(garage).to receive (:unload_van)

		van.deliver_broken_bikes(garage)
  end
end