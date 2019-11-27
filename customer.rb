class Customer

  attr_reader :name, :wallet, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0
  end

  def decrease_money_in_wallet(amount)
    @wallet -= amount
  end

end
