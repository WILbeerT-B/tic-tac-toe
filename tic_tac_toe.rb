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

  def update_board(index, marker)
    @cell[index-1] = marker
  end
end


class Game

  WIN_COMBOS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2] ]
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
    
    print "Player #{current_player.number}. Choose a cell: "
    player_choice = gets.chomp.to_i
    if is_input_valid?(player_choice)
      if is_cell_empty?(player_choice)
        @count += 1
        @board.update_board(player_choice, current_player.marker)
        check_winner()
        #is_board_full?()
        if is_draw?()
          puts "Game is draw!"
        end
      else
        puts "Cell #{player_choice} is not empty, please choose an empty cell."
      end
    else
      puts "Input #{player_choice} is not valid, please enter position 1-9."
    end
  end

  def is_cell_empty?(index)
    !(@board.cell[index-1] == "X" || @board.cell[index-1] == "O")
  end

  def is_input_valid?(input)
    (1..9).include?(input)
  end

  def check_winner()
    WIN_COMBOS.any? do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      position_1 = @board.cell[index_1]
      position_2 = @board.cell[index_2]
      position_3 = @board.cell[index_3]
      if position_1 == position_2 && position_2 == position_3 && @board.cell[index_1] != ""
        @count = 10
        if @board.cell[win_combo[0]]  == "X"
          puts "Player 1 wins!"
          
        elsif @board.cell[win_combo[0]]  == "O"
          puts "Player 2 wins!"
        end
        true
      end
    end
  end

  def is_board_full?()
    @board.cell[0..8].all? { |c| %w[X O].include?(c) }
  end

  def is_draw?()
    is_board_full?() && !check_winner()
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
