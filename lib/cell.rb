class Cell
  attr_reader :coordinate,
              :ship,
              :empty,
              :render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
    @render = "."
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end
  
  def fire_upon
    @fired_upon = true
    @ship.hit
  end

  def fired_upon?
    @fired_upon
  end

  def render
    if (@fired_upon == true) && (@empty == true)
      "M"
    elsif (@fired_upon == true) && (@empty = false)
      "H"
    elsif (@fired_upon == true) && (@empty = false) && (@ship.sunk = true)
      "S"
    else
      "."
    end
  end
end