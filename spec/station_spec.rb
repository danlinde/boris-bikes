require_relative '../lib/station'

describe Station do 
  let(:station){Station.new('Pimlico', {'s-123-ab' => 'Available', 's-234-cd' => 'Not Available'})}
  
  it 'can referenced by name' do 
  	expect(station.name).to eq 'Pimlico'
  end

  it 'can create a list of bike details' do 
    expect(station.list_of_bikes()).to eq({"s-123-ab"=>"Available", "s-234-cd"=>"Not Available"})
  end

  context 'when bikes available at station' do

    it 'returns the serial number of the bike rented' do 
      expect(station.rent_out_a_bike).to eq 's-123-ab'
    end

    it 'can update a bike to not available' do 
      expect(station.bike_unavailable("s-123-ab")).to eq "Not Available"
    end

    it 'can tell you if bikes are available' do 
      expect(station.bike_available?).to eq true
    end

    it "returns an available bike's serial number" do 
      expect(station.serial_num).to eq 's-123-ab'
    end
  end
end
