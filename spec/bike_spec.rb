require_relative '../lib/bike'

describe Bike do
	let(:bike) {Bike.new}
    
  context 'when a bike has been created' do 
    it 'should have a serial_number' do 
    	expect(bike.serial_number).to be_true  
    end

    it 'should be in working order' do
    	expect(bike.working_order).to be_true
    end

    it 'should receive a serial number' do
    	expect(bike.set_serial_number).to match(/\d+-abc-\d+/)
    end

    it 'should return bike details' do
    	expect(bike.bike_details).to match(/\d+-abc-\d+ => true/)
    end
    
    it 'can give the working order' do 
      expect(bike.working_order?).to be_true
    end
    
    it 'can be broken' do
      bike.broken
      expect(bike.working_order).to be_false
    end
    
    it 'can be fixed' do 
      bike.fixed
      expect(bike.working_order).to be_true
    end
  end
end