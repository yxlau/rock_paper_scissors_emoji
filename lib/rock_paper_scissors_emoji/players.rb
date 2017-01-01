class Player
  attr_accessor :name, :points, :move
  def initialize(name='Player 1')
    @name = name
    @points = 0
    @move = ''
  end
end
