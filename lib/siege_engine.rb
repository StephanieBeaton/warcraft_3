
# AP: 50
# HP: 400

class SiegeEngine < Unit

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access
    # to these variables (via attr_reader, attr_writer or attr_accessor)

    # initialize(health_points, attack_power)
    super(400, 50)
  end

  def attack!(enemy)
    # siege engine should deal 50 (AP) damage to the enemy
    # if enemy is a unit cannot damage enemy
    # if enemy is a barracks then can double damage
    if enemy.class == Peasant
      enemy.damage(0)
    elsif enemy.class == Footman
      enemy.damage(0)
    elsif enemy.class == Barracks
      enemy.damage(attack_power * 2)
    else
      enemy.damage(attack_power)
    end
  end

end
