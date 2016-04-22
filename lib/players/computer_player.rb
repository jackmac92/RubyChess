require "benchmark"

class ComputerPlayer < Player

  def take_turn
  	piece = nil
  	loop {
  		piece = pieces[rand(pieces.length)]
  		break unless piece.valid_moves.empty?
  	}
  	p piece.valid_moves
  	start_pos = piece.pos
  	end_pos = piece.valid_moves[rand(piece.valid_moves.count)]
  	board.move(start_pos, end_pos)
  end


end
