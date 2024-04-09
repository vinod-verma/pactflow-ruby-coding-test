require_relative 'tennis_game'
class TennisTournament
  include TennisGame
  def initialize
    @player1_points = 0
    @player2_points = 0
    @player1_games = 0
    @player2_games = 0
  end

  def point_won_by(player)
    update_game(player)
  end

  def score
    if @tiebreak
      "#{@player1_games}-#{@player2_games}, #{@tiebreak_points[0]}-#{@tiebreak_points[1]}"
    else
      "#{@player1_games}-#{@player2_games}, #{game_score(@player1_points)}-#{game_score(@player2_points)}"
    end
  end
end