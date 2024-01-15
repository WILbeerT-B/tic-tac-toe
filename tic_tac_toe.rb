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
    puts " #{@cell[0]} | #{@cell[1]} | #{@cell[2]}"
    puts "---+---+---"
    puts " #{@cell[3]} | #{@cell[4]} | #{@cell[5]}"
    puts "---+---+---"
    puts " #{@cell[6]} | #{@cell[7]} | #{@cell[8]}"
    puts ""
  end

  def update_board(position, marker)
    @cell[position-1] = marker
  end
end


class Game
  attr_reader :message

  def initialize
    @player1 = Player.new('1', 'X')
    @player2 = Player.new('2', 'O')
    @board = Board.new()
    @message = "Let's play!"
    @count = 1
  end

  def player_select
    if @count % 2 == 0
      @player2
    else
      @player1
    end
  end

  def player_move(current_player)
    puts "Player #{current_player.number}. Choose a cell:"
    player_choice = gets.chomp.to_i
    if is_cell_empty?(player_choice)
      @count += 1
      @board.update_board(player_choice, current_player.marker)
    else
      puts "Cell #{player_choice} is not empty, please choose an empty cell."
    end
  end

  def is_cell_empty?(position)
    !(@board.cell[position-1] == "X" || @board.cell[position-1] == "O")
  end

  def play_round
    puts @message
    @board.display_board
    while @count < 10 do
      player_move(player_select)
      @board.display_board
    end
  end

end

tictactoe = Game.new()
tictactoe.play_round
