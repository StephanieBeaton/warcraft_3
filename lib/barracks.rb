class Barracks

  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman?
    return false if food < 2
    return false if gold < 135

    true

  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_peasant?
    return false if food < 5
    return false if gold < 90

    true
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def damage(attack_power)
    # should reduce the barrack's health_points by the attack_power specified
    @health_points -= attack_power
  end

  def can_build_siege_engine?
    return false if gold < 200
    return false if lumber < 60
    return false if food < 3

    true

  end

  def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @lumber -= 60
      @food -= 3
      SiegeEngine.new
    end

  end

end
