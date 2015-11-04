class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    # Need to default the 2 instance variables here
    # Also also give code outside this class access
    # to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    # footman should deal 10 (AP) damage to the enemy unit
    # if unit is dead unit cant damage enemy
    return if dead?
    enemy.damage(self.attack_power)
  end

  def damage(attack_power)
    # should reduce the unit's health_points by the attack_power specified
    @health_points -= attack_power
  end

  def dead?
    return false if @health_points > 0

    true
  end
end
