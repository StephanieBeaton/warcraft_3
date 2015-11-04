require_relative 'spec_helper'

# Units start off alive but they die if their HP hits 0 or lower.
# This is usually a result of receiving damage from combat.

# Implementation: Define a method dead? on the Unit class.
# We add it to Unit instead of Footman for example b/c all units can die,
#  not just footman or peasants.


describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#dead?" do
    it "should be dead if the unit's health_points hits 0 or lower." do
      @unit.damage(100)
      expect(@unit.dead?).to eq(true) # HP started at 100 but just got hit by 100
    end
  end

  describe "#dead?" do
    it "should be alive if the unit's health_points is greater than 0." do
      @unit.damage(99)
      expect(@unit.dead?).to eq(false) # HP started at 100 but just got hit by 99
    end
  end

end

