class Pub

  attr_reader :name

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
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

  def remove_drink(drink)
    @drinks.delete(drink)
    return nil
  end

  def sell_drink(drink, customer)
    customer.decrease_money_in_wallet(drink.price)
    @till += drink.price
    @drinks.delete(drink)
    customer.increase_drunkness(drink)

  end

end
