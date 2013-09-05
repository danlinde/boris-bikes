require_relative '../lib/garage'

describe Garage do
	let(:garage) {Garage.new}


	it 'unloads broken bikes from a van' do
		van = double :van
		expect(van).to receive (:broken_bikes)

		garage.unload_van(van)
	end

	it 'fixes broken bikes' do 
		bike = double(:bike, {:fixed => true, :working_order => true})
		van = double(:van, {:broken_bikes => bike})
    garage.unload_van(van)
    garage.fix! 
    expect(garage.fixed_bikes[0].working_order).to be_true
	end

	it 'can give list of fixed bikes' do 
    expect(garage.fixed_bikes).not_to eq nil
  end
end