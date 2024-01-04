require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'existst' do
    expect(@cell_1).to be_a(Cell)
  end

  it 'has readible attributes' do
    expect(@cell_1.coordinate).to eq("B4")
    expect(@cell_1.ship).to eq(nil)
    expect(@cell_1.empty?).to be true
  end

  it 'can #place_ship' do
    @cell_1.place_ship(@cruiser)

    expect(@cell_1.ship).to eq(@cruiser)#<Ship:0x00007f84f0891238...>
    
    expect(@cell_1.empty?).to be false
  end

  it 'can be #fired_upon' do
    @cell_1.place_ship(@cruiser)

    expect(@cell_1.fired_upon?).to be false
    
    @cell_1.fire_upon
    
    expect(@cell_1.ship.health).to eq(2) 
    expect(@cell_1.fired_upon?).to be true
  end

  describe '#render' do
    it 'renders . if the cell has not been fired upon' do
      expect(@cell_1.render).to eq(".")
    end
    
    it 'if fired upon, M is rendered when no ship is in cell' do
      expect(@cell_1.render).to eq(".")
      @cell_1.fire_upon

      expect(@cell_1.render).to eq("M")
    end

    it 'if fired upon, H is rendered when ship is in cell' do
      @cell_2.place_ship(@cruiser)

      # expect(@cell_2.render).to eq(".")
      # # Indicate that we want to show a ship with the optional argument
      # expect(@cell_2.render(true)).to eq("S")

      @cell_2.fire_upon

      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
    end

    it 'if fired upon, X is rendered when ship is sunk' do
      @cell_2.place_ship(@cruiser)

      expect(@cell_2.render).to eq(".")
      #       # Indicate that we want to show a ship with the optional argument
      # expect(@cell_2.render(true)).to eq("S")
      
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
      
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    end
  end
end









