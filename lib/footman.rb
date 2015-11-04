# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access
    # to these variables (via attr_reader, attr_writer or attr_accessor)

    # super(health_points, attack_power)
    super(60,10)
  end

  def attack!(enemy)
    # a Footman does only HALF of its AP as damage to a Barracks.
    if enemy.class == Barracks
      # The damage amount should be an integer (Fixnum).
      # Take the ceil division result.
      enemy.damage((self.attack_power.to_f/2.0).ceil)
    else
      # footman should deal 10 (AP) damage to the enemy unit
      enemy.damage(self.attack_power)
    end
  end

end
