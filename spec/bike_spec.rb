require_relative '../lib/bike'

describe Bike do
	let(:bike)	{Bike.new("s-123-ab")}

	it 'should have a serial number' do
		expect(bike.serial_number).to eq("s-123-ab")
	end

	it 'can break' do
		bike.break
		expect(bike.good_working_order).to be_false
	end

end