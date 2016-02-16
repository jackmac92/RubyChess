module SlidingPiece

  def valid_move?(pos)
    return -1 unless @board.in_bounds?(pos)
    if @board[pos].nil?
      return 1
    else
      if @board[pos].color == self.color
        return -1
      else
        return 0
      end
    end

  end

  def moves
    result = []
    move_dirs.each do |(dx,dy)|
      tmp_pos = pos

      loop do
        tmp_pos = [tmp_pos[0]+ dx, tmp_pos[1]+dy]
        case self.valid_move?(tmp_pos)
        when -1
          break
        when  0
          result << tmp_pos
          break
        when  1
          result << tmp_pos
        end
      end
    end
    result
  end
end
