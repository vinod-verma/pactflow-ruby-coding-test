module TennisGame
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