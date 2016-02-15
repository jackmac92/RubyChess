# require "./piece.rb"

module SlidingPiece
  def moves
    result = []
    # debugger
    move_dirs.each do |(dx,dy)|
      tmp_pos = pos

      loop do
        tmp_pos = [tmp_pos[0]+ dx, tmp_pos[1]+dy]
        break unless @board.in_bounds? tmp_pos
        break if !@board[tmp_pos].nil?
        result << tmp_pos
      end
    end
    result
  end
end
