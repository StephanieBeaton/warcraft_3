
require_relative 'spec_helper'

# Introduce a SiegeEngine Unit.
# The SiegeEngine is very effective against buildings such as the Barracks.
# It is however ineffective against other units
# (can't attack them, as though they were dead).

# So unlike with Footman
# (whose attacks do a fraction of the damage they normally would),
# the SiegeEngine does 2x the damage against the Barracks

# Also, Siege Engines can attack other siege engines
# even though they cannot attack any other units
# (such as Peasants or Footmen)

# Stats:

# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food
#
# Notes:

# You will need to require the seige_engine.rb file in spec_helper.rb

describe SeigeEngine do

  before :each do
    @seige_engine = SeigeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@seige_engine.attack_power).to eq(50)
  end

  # ================================================================
  describe "#damage" do
    it "should reduce the seige_engine's health_points by the attack_power specified" do
      @seige_engine.damage(12)
      expect(@seige_engine.health_points).to eq(388) # HP started at 400 but just got hit by 12 (see subject)
    end
  end

  # Siege Engines can attack other siege engines
  describe "#attack!" do
    it "should deal the appropriate (attack power based) damage to another seige engine" do
      enemy_seige_engine = SeigeEngine.new
      #  ???
      expect(enemy_seige_engine).to receive(:damage).with(3)
      @seige_engine.attack!(enemy_seige_engine)
    end
  end

  # the SiegeEngine does 2x the damage against the Barracks
  describe "#attack!" do
    it "should deal the appropriate (attack power based) damage to the barracks" do
      enemy_barracks = Baracks.new
      #  ???
      expect(enemy_barracks).to receive(:damage).with(@seige_engine.attack_power * 2)
      @seige_engine.attack!(enemy_baracks)
    end
  end

  # It is however ineffective against other units
  # (can't attack them, as though they were dead).
  describe "#attack!" do
    it "should deal the appropriate (attack power based) damage to unit" do
      enemy_unit = Footman.new
      #  ???
      expect(enemy_unit).to receive(:damage).with(3)
      @seige_engine.attack!(enemy_unit)
    end
  end

end


describe Barracks do

  describe "#build_seige_engine" do

    before :each do
      @barracks = Barracks.new
    end

    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500

    it "costs 200 gold" do
      @barracks.build_seige_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 60 lumber" do
      @barracks.build_seige_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "costs 3 food" do
      @barracks.build_seige_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "produces a seige engine" do
      seige_engine = @barracks.build_seige_engine
      expect(seige_engine).to be_an_instance_of(SeigeEngine)
    end


  end


end


