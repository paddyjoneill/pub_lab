class Pub

  attr_reader :name

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def till_balance
    return @till
  end

  def take_payment(amount)
    @till += amount
  end

  def check_stock
    return @drinks
  end

  def check_food_stock
    return @food
  end

  def remove_drink(drink)
    @drinks.delete(drink)
    return nil
  end

  def sell_drink(drink, customer)
    if customer.wallet >= drink.price && customer.age >= 18 && customer.drunkness < 4
      customer.decrease_money_in_wallet(drink.price)
      @till += drink.price
      @drinks.delete(drink)
      customer.increase_drunkness(drink)
    end
  end

  def sell_food(food, customer)
    if customer.wallet >= food.price
      customer.decrease_money_in_wallet(food.price)
      @till += food.price
      customer.decrease_drunkness(food)
      @food.delete(food)
    end
  end

end
