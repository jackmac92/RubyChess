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

  def to_s
    rook = "\u2656".encode('utf-8')
    " #{rook} "
  end

end
