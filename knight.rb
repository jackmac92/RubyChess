class Knight < Piece
  include SteppingPiece
  def move_dirs
    [
      [-1,2],
      [1,2],
      [-1,-2],
      [1,-2],
      [-2,1],
      [2,1],
      [-2,-1],
      [2,-1]
    ]

  end
end
