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

  def to_s
    knight = "\u2658".encode('utf-8')
    " #{knight} "
  end

end
