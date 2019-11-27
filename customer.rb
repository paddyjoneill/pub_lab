class Customer

  attr_reader :name, :wallet, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0
  end


end
