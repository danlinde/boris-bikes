require_relative '../lib/station'
require_relative '../lib/garage'

describe Station do 
  let(:station){Station.new('Pimlico', 2)}
  let(:station_garage){Station.new('Pimlico', 2)}
  
  it 'can referenced by name' do 
  	expect(station.name).to eq 'Pimlico'
  end

  it 'can create a list of bike details' do 
    station.new_stock
    expect(station.list_of_bikes).to be_true
  end
  
  it 'can be stocked with a set of bikes' do
    station.new_stock
  end

  it 'is stocked with bikes' do 
    station.new_stock
    expect(station.list_of_bikes.length).to eq 1 
   end

  it 'gives the bike rented if bikes available' do 
    station.new_stock 
    expect(station.rent_out_a_bike).to be_true
  end

  it 'removes bike from list when rented' do 
    station.new_stock
    station.rent_out_a_bike
    expect(station.list_of_bikes.length).to eq 0
  end

  it 'can update a bike to broken' do 
    station.new_stock
    station.rent_out_a_bike 
    expect(station.bike_broken).to eq false
  end

  it 'can tell you if bikes are available' do 
    station.new_stock 
    expect(station.bikes_available?).to eq true
  end

  it 'can tell you which bikes are available' do 
    station.new_stock
    expect(station.bikes_available).not_to eq nil
  end

  it 'can tell you if space is available' do 
    station.new_stock 
    expect(station.space_available).to eq true
  end

  it 'can accept a bike if space available' do 
    station.new_stock 
    expect(station.accept_bike(station.bike)).to be_true
  end

  it 'cannot accept a bike if no space available' do 
    station.new_stock 
    station.accept_bike(station.bike)
    expect(station.accept_bike(station.bike)).to be_false
  end

  it 'knows about all broken bikes' do
    station.new_stock
    station.rent_out_a_bike 
    station.bike_broken
    
    expect(station.broken_bikes).to be_true
  end 
  
  it 'asks a van to accept broken bikes' do
    station.new_stock 
    station.rent_out_a_bike 
    station.bike_broken
    van = double :van 
    expect(van).to receive(:accept_broken_bikes)

    station.load_van(van)
  end

  it 'updates list of bikes to show bikes sent to garage' do
    station.new_stock 

    van = double(:van, {:accept_broken_bikes => true})
    station.load_van(van)
    expect(station.list_of_bikes).to be_true
  end

  it 'unloads fixed bikes from van' do 
    station.new_stock 
    # station.rent_out_a_bike 
    # station.accept_bike(station.bike)
    # station.bike_broken
    
    van = double(:van, {:fixed_bikes => })

    station.unload_van(van)
  end

  it 'updates list of bikes to show bikes received from the garage' do
    station.new_stock 
    station.rent_out_a_bike 
    station.accept_bike(station.bike)
    station.bike_broken
    van = double(:van, {:accept_broken_bikes => true})
    station.load_van(van)
    van2 = double(:van, {:fixed_bikes => true})
    station.unload_van(van2)
    
    expect(station.list_of_bikes[0].working_order?).to eq true 
  end




end
