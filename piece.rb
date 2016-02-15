class Piece

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  # def to_s
  #   if nil?
  #     " "
  #   else
  #     " "
  #   end
  # end

  protected
  attr_reader :pos

end
