class Rook < Piece
  prepend SlidingPiece
  def move_dirs
    [
      [0, -1],
      [0, 1],
      [1, 0],
      [-1, 0]
    ]
  end

end
