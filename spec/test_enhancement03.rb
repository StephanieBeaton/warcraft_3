require_relative 'spec_helper'

# A dead unit cannot attack another unit.
# Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#attack!" do
    it "which is dead cannot attack another unit." do
      @unit.damage(100)
      enemy = Unit.new(100, 3)
      before_attack_hp = enemy.health_points
      expect(@unit.dead?).to eq(true)
      @unit.attack!(enemy)
      expect(enemy.health_points).to eq(before_attack_hp)
    end
  end

  describe "#attack!" do
    it "which is alive can attack another unit." do
      @unit.damage(99)
      enemy = Unit.new(100, 3)
      before_attack_hp = enemy.health_points
      result = before_attack_hp - @unit.attack_power
      expect(@unit.dead?).to eq(false)
      @unit.attack!(enemy)
      expect(enemy.health_points).to eq(result)
    end
  end

end
