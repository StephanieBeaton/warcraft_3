
# AP: 50
# HP: 400

class SeigeEngine

  attr_reader :health_points, :attack_power


  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access
    # to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = 400
    @attack_power  = 50
  end

  def damage(attack_points)
    @health_points -= attack_points
  end

  def attack!(enemy)
    # seige engine should deal 50 (AP) damage to the enemy
    # if enemy is a unit cannot damage enemy
    # if enemy is a barracks then can double damage
    return if enemy.superclass = Unit
    if enemy.class == Barracks
      enemy.damage(self.attack_power * 2)
    else
      enemy.damage(self.attack_power)
    end
  end

end
