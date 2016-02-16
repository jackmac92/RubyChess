require "./requirements.rb"

class Game
  attr_reader :board, :player_one, :player_two
  def initialize
    @board = Board.new
    @player_one = Player.new @board, :white
    @player_two = Player.new @board, :black
    populate_white
    populate_black
  end

  def play
    players = [player_one, player_two]
    until game_over?
      curr_player = players.first
      player_move = curr_player.take_turn
      # board.move(player_move[0],player_move[1])
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

  def populate_white
    player_one.pieces = [
    King.new([0,4], board, :white),
    Queen.new([0,3], board, :white),
    Bishop.new([0,2], board, :white),
    Bishop.new([0,5], board, :white),
    Knight.new([0,1], board, :white),
    Knight.new([0,6], board, :white),
    Rook.new([0,0], board, :white),
    Rook.new([0,7], board, :white)
  ]
    8.times do |col|
      player_one.pieces << Pawn.new([1, col], board, :white)
    end

  end

  def populate_black
    player_two.pieces = [
    King.new([7,4], board, :black),
    Queen.new([7,3], board, :black),
    Bishop.new([7,2], board, :black),
    Bishop.new([7,5], board, :black),
    Knight.new([7,1], board, :black),
    Knight.new([7,6], board, :black),
    Rook.new([7,0], board, :black),
    Rook.new([7,7], board, :black)
  ]
    8.times do |col|
      player_two.pieces << Pawn.new([6, col], board, :black)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new.play
end
