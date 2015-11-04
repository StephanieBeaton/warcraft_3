require_relative 'spec_helper'

# buildings can also be attacked by units.
# Since a barracks is a building, it has substantial more HP (500)
# To make matters worse, a Footman does only HALF of its AP as damage to a Barracks.
# This is because they are quite ineffective against buildings.

# Note: The damage amount should be an integer (Fixnum).
# Take the ceil division result. <-- Barracks.damage

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 health_points" do
    expect(@barracks.health_points).to eq(500)
  end


end



describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should deal the appropriate (attack power based) damage to the barracks" do
      barracks = Barracks.new
      expect(barracks).to receive(:damage).with(@footman.attack_power/2)
      @footman.attack!(barracks)
    end
  end

end
