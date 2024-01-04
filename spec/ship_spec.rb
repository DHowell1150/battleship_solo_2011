require './lib/ship'

RSpec.describe Ship do
  before do 
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cruiser).to be_a(Ship)
  end

  it 'has readable attributes' do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it 'can get #sunk with #hit equal to ship.health' do
    expect(@cruiser.sunk?).to be false

    @cruiser.hit
    expect(@cruiser.health).to eq(2)  

    @cruiser.hit
    expect(@cruiser.health).to eq(1)
    expect(@cruiser.sunk?).to eq(false)

    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end
end



