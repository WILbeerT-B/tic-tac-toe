class Player
  
  attr_reader :number, :marker

  def initialize(number, marker)
    @number = number
    @marker = marker
    puts "Player #{@number}: Your marker is #{@marker}  "
  end
end

class Board

  attr_reader :cell

  def initialize
    @cell = Array(1..9)
  end

  def display_board
    puts ""
    puts " #{cell[0]} | #{cell[1]} | #{cell[2]}"
    puts "---+---+---"
    puts " #{cell[3]} | #{cell[4]} | #{cell[5]}"
    puts "---+---+---"
    puts " #{cell[6]} | #{cell[7]} | #{cell[8]}"
    puts ""
  end

end

class Game
  
  attr_reader :message

  def initialize
    @player1 = Player.new(1, 'x')
    @player2 = Player.new(2, 'o')
    @board = Board.new()
    @message = "Let's play!"
    
  end


  def play_round
    puts @message
    @board.display_board
    
  end
  

end

game = Game.new()
game.play_round
