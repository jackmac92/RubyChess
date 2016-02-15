class Piece

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  # def to_s
  #   if nil?
  #     " "
  #   else
  #     " "
  #   end
  # end

  protected
  attr_reader :pos, :color, :board

end
