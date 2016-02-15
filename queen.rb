class Queen < Piece
  prepend SlidingPiece
  def move_dirs
    [
      [0, -1],
      [0, 1],
      [1, 0],
      [-1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

end
