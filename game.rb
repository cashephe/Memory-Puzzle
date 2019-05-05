require_relative "board"
class Game
  attr_reader :prevGuess
  def initialize
    @game = Board.new
    @prevGuess = ""
    @secGuess = ""
  end

  def play
    until @game.won?
      @game.render
      p @prevGuess = @game.reveal
      @game.render
      p @secGuess = @game.reveal
      @game.render
      sleep(1)
      system("clear")
      if @prevGuess.value != @secGuess.value
        puts "Sorry not a match"
        @prevGuess.hide
        @secGuess.hide
      else
        puts "It's a match!"
      end
    end
  end
end

game = Game.new
game.play
