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
  def initialize(board)
    @display = Display.new(board)
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
    start_pos = move
    end_pos = move
    [start_pos,end_pos]
  end
end
