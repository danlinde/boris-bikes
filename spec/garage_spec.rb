require_relative '../lib/garage'

describe Garage do
	let(:garage) {Garage.new}


	it 'asks a van for broken bikes' do
		van = double :van
		expect(van).to receive (:broken_bikes)

		garage.unload_van(van)
	end

	it 'can send fixed bikes back to the station' do
	  van = double :van
		expect(van).to receive (:fixed_bikes)

		garage.fixed_bikes(van)
	end


end