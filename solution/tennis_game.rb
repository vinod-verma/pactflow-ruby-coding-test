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

    if @player1_games == 6 && @player2_games == 6
      @tiebreak = true
    end
  end

  def update_tiebreak(player)
    if player == "player1"
      @tiebreak_points[0] += 1
    else
      @tiebreak_points[1] += 1
    end

    if @tiebreak_points[0] >= 7 && @tiebreak_points[0] >= @tiebreak_points[1] + 2
      @player1_games += 1
      reset_tiebreak
    elsif @tiebreak_points[1] >= 7 && @tiebreak_points[1] >= @tiebreak_points[0] + 2
      @player2_games += 1
      reset_tiebreak
    end
  end

  def reset_points
    @player1_points = 0
    @player2_points = 0
  end

  def reset_tiebreak
    @tiebreak = false
    @tiebreak_points = [0, 0]
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