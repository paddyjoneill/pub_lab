require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink.rb')
require_relative('../customer.rb')

class CustomerTest < MiniTest::Test

  def setup
    @customer = Customer.new("Paddy", 30, 35)
    @drink = Drink.new("red wine", 6, 5)
  end

  def test_customer_has_a_name
    assert_equal("Paddy",@customer.name)
  end

  def test_customer_has_a_wallet
    assert_equal(30, @customer.wallet)
  end

  def test_customer_has_an_age
    assert_equal(35, @customer.age)
  end

  def test_can_remove_money_from_wallet
    assert_equal(25, @customer.decrease_money_in_wallet(5))
  end

  def test_can_increase_drunkness
    @customer.increase_drunkness(@drink)
    assert_equal(5, @customer.drunkness)
  end

  


end
