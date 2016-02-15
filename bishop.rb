class Bishop < Piece
  include SlidingPiece
  # MOVE_DIRS =
  #   [
  #     [-1, -1],
  #     [-1, 1],
  #     [1, -1],
  #     [1, 1]
  #   ]

  def move_dirs
    [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

end
