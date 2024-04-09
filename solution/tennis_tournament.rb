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

  def score
    if @tiebreak
      "#{@player1_games}-#{@player2_games}, #{@tiebreak_points[0]}-#{@tiebreak_points[1]}"
    else
      "#{@player1_games}-#{@player2_games}, #{game_score(@player1_points)}-#{game_score(@player2_points)}"
    end
  end

  private

  def update_game(player)
    if player == "player1"
      @player1_points += 1
    else
      @player2_points += 1
    end

    if @player1_points >= 4 && @player1_points >= @player2_points + 2
      @player1_games += 1
      reset_points
    elsif @player2_points >= 4 && @player2_points >= @player1_points + 2
      @player2_games += 1
      reset_points
    elsif @player1_points >= 3 && @player2_points >= 3 && @player1_points == @player2_points
      @player1_points = 3
      @player2_points = 3
    end
  end

  def reset_points
    @player1_points = 0
    @player2_points = 0
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