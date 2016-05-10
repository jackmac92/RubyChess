class ComputerPlayer < Player

  def take_turn
    begin
    	piece = nil
    	loop do
    		piece = pieces[rand(pieces.length)]
    		break unless piece.valid_moves.empty?
    	end
    	start_pos = piece.pos
    	end_pos = piece.valid_moves[rand(piece.valid_moves.count)]
    	board.move(start_pos, end_pos)      
    rescue ChessGameError => e 
      retry
    end
  end


end
