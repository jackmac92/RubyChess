class Player
  attr_accessor :pieces, :display
  attr_reader :board, :color
  def initialize(board, color)
    @board = board
    @display = Display.new(board)
    @color = color
    @pieces = []
  end

  def move
    result = nil
    until result
      @display.render(self.color)
      result = @display.get_input
    end
    result
  end

  def take_turn
    begin
      start_pos = move
      check_error(start_pos)
      update_overlay(start_pos)
      end_pos = move
      board.move(start_pos,end_pos)
      clear_overlay
    rescue ChessGameError => e
      puts e.message
      sleep(1)
      clear_overlay
      retry
    end
  end

  private
  def clear_overlay
    display.selected = nil
    display.highlighted = []
  end

  def update_overlay(start_pos)
    display.selected = start_pos
    display.highlighted = board[start_pos].valid_moves

  end

  def check_error(board_start_pos)
    if board[board_start_pos].nil?
      raise ChessGameError.new("No piece at #{board_start_pos}, try again")
    elsif board[board_start_pos].color != self.color
      raise ChessGameError.new("That is not your piece!")
    elsif board[board_start_pos].moves.count == 0
      raise ChessGameError.new("This piece can't go anywhere!")
    end

  end


end
