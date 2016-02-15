module SteppingPiece
  def moves
    result = []
    move_dirs.each do |(dx,dy)|
      new_pos = [pos[0]+ dx, pos[1]+dy]
      result << new_pos if (@board.in_bounds?(new_pos) && @board[new_pos].nil?)
    end
    result
  end
end
