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
end
