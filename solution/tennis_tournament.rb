require_relative 'tennis_game'
class TennisTournament
  include TennisGame
  attr_accessor :player1_games, :player2_games
  attr_reader :tiebreak
  def initialize
    @player1_points = 0
    @player2_points = 0
    @player1_games = 0
    @player2_games = 0
    @tiebreak = false
    @tiebreak_points = [0, 0]
  end

  def point_won_by(player)
    if @tiebreak
      update_tiebreak(player)
    else
      update_game(player)
    end
  end

  def score
    if @tiebreak
      "#{@player1_games}-#{@player2_games}, #{@tiebreak_points[0]}-#{@tiebreak_points[1]}"
    else
      "#{@player1_games}-#{@player2_games}, #{game_score(@player1_points)}-#{game_score(@player2_points)}"
    end
  end
end