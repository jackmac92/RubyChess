require "colorize"
require "./cursorable"

class Display
  attr_accessor :selected
  include Cursorable

  def initialize(board)
    @board = board
    # @game = game
    @cursor = [0,0]
    @selected = nil

  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      if piece
        piece.to_s.colorize(color_options)
      else
        "  ".colorize(color_options)
      end
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor
      bg = :light_red
    elsif [i, j] == @selected
      bg = :yellow
    elsif (i + j).odd?
      bg = :light_black

    else
      bg = :light_white
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

end
