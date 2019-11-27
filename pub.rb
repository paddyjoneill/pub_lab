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



end
