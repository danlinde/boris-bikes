require_relative '../lib/station'

describe Station do 
  let(:station){Station.new('Pimlico', {'s-123-ab' => 'available', 's-234-cd' => 'broken'}, 10)}
  let(:station_garage){Station.new('Pimlico', {'s-123-ab' => 'available', 's-234-cd' => 'broken', 's-235-cd' => 'garage'}, 10)}
  it 'can referenced by name' do 
  	expect(station.name).to eq 'Pimlico'
  end

  it 'can create a list of bike details' do 
    expect(station.list_of_bikes()).to eq({"s-123-ab"=>"available", "s-234-cd"=>"broken"})
  end

    it 'gives the bike rented if bikes available' do 
      expect(station.rent_out_a_bike).to eq 's-123-ab'
    end

    it 'can update a bike to broken' do 
      expect(station.broken("s-123-ab")).to eq "broken"
    end

    it 'can tell you if bikes are available' do 
      expect(station.bike_available).to eq true
    end

    it 'returns an available bike' do 
      expect(station.bike).to eq 's-123-ab'
    end

    it 'can tell you if space is available' do 
      expect(station.space_available).to eq true
    end

    it 'can accept a bike if space available' do 
      expect(station.accept_bike('s-222-ab' => 'working')).to eq({"s-123-ab"=>"available", "s-234-cd"=>"broken", "s-222-ab"=>"working"})
    end

    it 'knows about all broken bikes' do
      expect(station.broken_bikes).to eq({'s-234-cd' => 'broken'})
    end 
    
    it 'asks a van to accept broken bikes' do
      van = double :van 
      expect(van).to receive(:accept_broken_bikes)

      station.load_van(van)
    end

    it 'updates list of bikes to show bikes sent to garage' do
      van = double(:van, {:accept_broken_bikes => true})
      station.load_van(van)
      expect(station.list_of_bikes).to eq({'s-123-ab' => 'available', 's-234-cd' => 'garage'})
    end

    it 'asks a van to return fixed bikes' do 
      van = double :van 
      expect(van).to receive(:deliver_fixed_bikes)

      station.unload_van(van)
    end

    it 'updates list of bikes to show bikes sent to garage' do
      
      van = double(:van, {:deliver_fixed_bikes => true})
      station_garage.unload_van(van)
      expect(station_garage.list_of_bikes).to eq({"s-123-ab"=>"available", "s-234-cd"=>"broken", "s-235-cd"=>"available"})
    end




end
