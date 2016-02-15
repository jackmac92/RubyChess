class Bishop < Piece
  prepend SlidingPiece

  def move_dirs
    [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

end
