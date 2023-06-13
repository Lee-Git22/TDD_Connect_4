require_relative './lib/game'

loop do
  game = Game.new
  game.play
  break 
end