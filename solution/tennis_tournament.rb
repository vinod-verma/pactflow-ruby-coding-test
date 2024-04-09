class TennisTournament
  def initialize
    @player1_points = 0
    @player2_points = 0
    @player1_games = 0
    @player2_games = 0
  end

  def point_won_by(player)
    update_game(player)
  end

  private

  def update_game(player)
    if player == "player1"
      @player1_points += 1
    else
      @player2_points += 1
    end
  end

  def game_score(points)
    case points
    when 0
      "0"
    when 1
      "15"
    when 2
      "30"
    when 3
      "40"
    when 4
      "AD"
    end
  end
end