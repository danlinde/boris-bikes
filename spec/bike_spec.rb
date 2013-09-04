require_relative '../lib/bike'

describe Bike do
	let(:bike) {Bike.new}
    
    context 'when a bike has been created' do 
      it 'should have a serial_number' do 
      	expect(bike.serial_number).to be_true
        
      end
  end
	# it 'should have a serial number' do
	# 	expect(bike.serial_number).to eq("s-123-ab")
	# end

	# it 'can be broken' do
	# 	bike.broken
	# 	expect(bike.good_working_order).to be_false
	# end

	# it 'can be fixed' do 
	# 	bike.fixed
	# 	expect(bike.good_working_order).to be_true
	# end



end