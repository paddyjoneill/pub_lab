class Customer

  attr_reader :name, :wallet, :age, :drunkness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0
  end

  def decrease_money_in_wallet(amount)
    @wallet -= amount
  end

  def increase_drunkness(drink)
    @drunkness += drink.alcohol_level
  end

  def decrease_drunkness(food)
    if food.rejuvination_level > @drunkness
      @drunkness = 0
    else
      @drunkness -= food.rejuvination_level
    end
  end

  def can_afford_drink(drink)
    if @wallet >= drink.price
      return true
    end
    return false
  end

end
