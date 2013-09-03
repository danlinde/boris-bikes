require_relative '../lib/van'

describe Van do
	let(:van) {Van.new('rodney')}

	it 'can be created' do
		van = Van.new('cecil')
		expect(van.name).to eq 'cecil'
	end

	it 'can ask a station for broken bikes' do
		station = double :station
		expect(station).to receive (:broken_bikes)

		van.accept_broken_bikes(station)
	end

	it 'can accept broken bikes' do
		station = double(:station, {:broken_bikes => {'s-123-ab' => 'broken', 's-234-cd' => 'broken'}})
		expect(van.accept_broken_bikes(station)).to eq({'s-123-ab' => 'broken', 's-234-cd' => 'broken'})
		end


	it 'can ask a garage for fixed bikes' do
		garage = double :garage
		expect(garage).to receive (:fixed_bikes)

		van.accept_fixed_bikes(garage)
	end

	it 'can accept fixed bikes' do
		garage = double(:garage, {:fixed_bikes => {'s-123-ab' => 'fixed', 's-234-cd' => 'fixed'}})
		expect(van.accept_fixed_bikes(garage)).to eq({'s-123-ab' => 'fixed', 's-234-cd' => 'fixed'})
	end

	it 'can deliver fixed bikes to station' do 
		station = double(:station, {:unload_van => {'s-123-ab' => 'fixed', 's-234-cd' => 'fixed'}})
		expect(van.deliver_fixed_bikes(station)).to eq({'s-123-ab' => 'fixed', 's-234-cd' => 'fixed'})
    end

    it 'can deliver broken bikes to garage' do 
       garage = double(:garage, {:unload_van => {'s-123-ab' => 'broken', 's-234-cd' => 'broken'}})
	   expect(van.deliver_broken_bikes(garage)).to eq({'s-123-ab' => 'broken', 's-234-cd' => 'broken'})
    end
end