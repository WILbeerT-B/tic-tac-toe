class Player
  
  attr_reader :number, :marker

  def initialize(number, marker)
    @number = number
    @marker = marker
    puts "Player #{@number}: Your marker is #{@marker}  "
  end
end

player1 = Player.new(1, 'x')
player2 = Player.new(2, 'o')