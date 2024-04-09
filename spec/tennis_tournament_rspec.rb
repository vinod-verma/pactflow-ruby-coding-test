require './solution/tennis_tournament'

RSpec.describe TennisTournament do

  let(:match) { TennisTournament.new } 

  describe "#point_won_by" do
    context "when player1 wins a point" do
      it "increments player1's points" do
        expect { match.point_won_by("player1") }.to change { match.instance_variable_get(:@player1_points) }.by(1)
      end
    end

    context "when player2 wins a point" do
      it "increments player2's points" do
        expect { match.point_won_by("player2") }.to change { match.instance_variable_get(:@player2_points) }.by(1)
      end
    end
  end

  describe "#score" do
    context "when no points are won" do
      it "returns '0-0, 0-0'" do
        expect(match.score).to eq("0-0, 0-0")
      end
    end

    context "when player1 wins one point" do
      it "returns '0-0, 15-0'" do
        match.point_won_by("player1")
        expect(match.score).to eq("0-0, 15-0")
      end
    end

    context "when player1 wins one game" do
      it "returns '1-0, 0-0'" do
        4.times {match.point_won_by("player1")}
        expect(match.score).to eq("1-0, 0-0")
      end
    end
  end

  describe "#deuce" do
    before(:all) do
      @match = TennisTournament.new
    end

    context "when 3 points have been scored by each player" do
      it "returns '0-0, 40-40'" do
        @match.point_won_by("player1")
        @match.point_won_by("player2")
        @match.point_won_by("player1")
        @match.point_won_by("player2")
        @match.point_won_by("player1")
        @match.point_won_by("player2")
        expect(@match.score).to eq("0-0, 40-40")
      end
    end

    context "when player1 wins have advantage" do
      it "returns '0-0, AD-40'" do
        @match.point_won_by("player1")
        expect(@match.score).to eq("0-0, AD-40")
      end
    end

    context "when player1 wins one game" do
      it "returns '1-0, 0-0'" do
        @match.point_won_by("player1")
        expect(@match.score).to eq("1-0, 0-0")
      end
    end
  end
end
