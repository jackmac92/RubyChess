# class Player
#   attr_reader :board
#   def initialize(name, board)
#     @name = name
#     @board = board
#   end
#
#   def get_input
#     puts "Input Start Position"
#     enter_input
#     puts "Input End Position"
#     enter_input
#
#   end
#
#   def enter_input
#     input = gets.chomp
#
#   end
#
# end


require_relative "display"

class Player
  attr_accessor :pieces, :display
  attr_reader :board, :color
  def initialize(board, color)
    @board = board
    @display = Display.new(board)
    @color = color
    @pieces = []
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end

  def take_turn
    begin
      start_pos = move
      display.selected = start_pos
      if board[start_pos].color != self.color
        raise ChessGameError.new("That is not your piece!")
      end
      end_pos = move
      display.selected = nil
      board.move(start_pos,end_pos)
    rescue ChessGameError => e
      puts e.message
      display.selected = nil
      sleep(1)
      retry
    end
    [start_pos,end_pos]
  end


end
