require "./Game"
require "./Player"

game = Game.new
p1 = Player.new("Player 1")
p2 = Player.new("Player 2")

game.start_game(p1, p2)


