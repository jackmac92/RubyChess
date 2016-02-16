class King < Piece
  include SteppingPiece
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

  def to_s
    king = "\u2654".encode('utf-8')
    " #{king} "
  end

end
