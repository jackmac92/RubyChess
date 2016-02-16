require "colorize"
require "./cursorable"

class Display
  attr_accessor :selected, :highlighted
  attr_reader :board
  include Cursorable

  def initialize(board)
    @board = board
    # @game = game
    @cursor = [0,0]
    @selected = nil
    @highlighted = []

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
    color = :default
    if [i, j] == @cursor
      bg = :light_red
    elsif [i, j] == @selected
      bg = :yellow
    elsif @highlighted.include? [i, j]
      bg = :blue
    elsif (i + j).odd?
      bg = :light_black
    else
      bg = :light_white
    end
    piece = board[[i,j]]
    if piece
      color = piece.color
    end

    { background: bg, color: color }
  end

  def render(msg)
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "It is #{msg.to_s.capitalize} Player's turn!"
    puts
    build_grid.each { |row| puts row.join }
  end

end
