class Pawn < Piece

  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def attackable_positions
    new_dirs = []
    attack_dirs = [[-1,-1], [-1, 1]]
    # debugger
    if color == :white
      attack_dirs.map! { |e| [e.first * -1, e.last] }
    end

    attack_dirs.each do |coord|
      new_pos = [pos[0] + coord[0], pos[1] + coord[1]]
      if valid_attack_move?(new_pos)
        new_dirs << coord
      end
    end
    new_dirs
  end

  def move_dirs
    dirs = color == :black ? [[-1,0]] : [[1,0]]
    dirs += attackable_positions
    if pos[0] == 6 && color == :black
      dirs << [-2,0]
    elsif pos[0] == 1 && color == :white
      dirs << [2,0]
    end
    dirs
  end

  def valid_attack_move?(pos)
    return false if @board[pos].nil?
    @board.in_bounds?(pos) &&
    @board[pos].color != self.color
  end


  def moves
    move_dirs.map do |(dx,dy)|
      [pos[0] + dx, pos[1] + dy]
    end
  end
end



#
# def attackable_positions
#   new_dirs = []
#   if color == :black
#     debugger
#     [[-1, -1], [-1, 1]].each do |coord|
#       new_pos = [pos[0] + coord[0], pos[1] + coord[1]]
#       if board.in_bounds?(coord) && !board[coord].nil?
#         new_dirs << coord
#       end
#     end
#   else
#     [[1, -1], [1, 1]].each do |coord|
#       new_pos = [pos[0] + coord[0], pos[1] + coord[1]]
#       if board.in_bounds?(new_pos) && !board[new_pos].nil?
#         new_dirs << coord
#       end
#     end
#   end
#   new_dirs
# end
