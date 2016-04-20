module SteppingPiece
  def moves
    result = []
    move_dirs.each do |(dx,dy)|
      new_pos = [pos[0]+ dx, pos[1]+dy]
      result << new_pos if self.valid_move?(new_pos)
    end
    result
  end
end
