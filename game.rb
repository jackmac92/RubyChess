require "./lib/requirements.rb"

class Game
  attr_reader :board, :player_one, :player_two
  def initialize
    @board = Board.new
    @player_one = Player.new @board, :white
    @player_two = single_player_mode? ? ComputerPlayer.new(@board, :black) : Player.new(@board, :black)
    populate_pieces
  end

  def single_player_mode?
    valid_response = nil
    puts "Play against computer? (y/n)"
    until valid_response
      print ">>> "
      input = gets.chomp.downcase[0]
      if input == "y" || input == "n"
        valid_response = true 
        input = input == "y"
      end
    end

    input    
  end

  def play
    players = [player_one, player_two]
    until game_over?
      curr_player = players.first
      player_move = curr_player.take_turn
      curr_player.pieces = board.grid.flatten.select { |piece| piece && piece.color == curr_player.color }
      players.rotate!
    end
  end

  def game_over?
    if board.check_mate?(:white)
      puts "Black Wins!"
      return true
    elsif board.check_mate?(:black)
      puts "White Wins!"
      return true
    end
    false
  end

  def populate_pieces
    [:black, :white].each do |color|
      y = color == :black ? 7 : 0
      player = color == :black ? player_two : player_one
      player.pieces = [
        King.new([y,4], board, color),
        Queen.new([y,3], board, color),
        Bishop.new([y,2], board, color),
        Bishop.new([y,5], board, color),
        Knight.new([y,1], board, color),
        Knight.new([y,6], board, color),
        Rook.new([y,0], board, color),
        Rook.new([y,7], board, color)
      ]
      8.times do |col|
        player.pieces << Pawn.new([(y-1).abs, col], board, color)
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
