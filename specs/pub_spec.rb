require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../pub.rb')

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("red wine", 6, 5)
    @drink2 = Drink.new("white wine", 5, 4)
    @drink3 = Drink.new("beer", 5, 3)
    @customer = Customer.new("Paddy", 30, 35)
    @customer1 = Customer.new("Stephen", 0, 25)
    @customer2 = Customer.new("Barry", 50, 17)
    @pub = Pub.new("Catherine's Bar", 200, [@drink1, @drink2, @drink3])
  end

  def test_pub_has_name
    assert_equal("Catherine's Bar", @pub.name())
  end

  def test_till_has_correct_initial_balance
    assert_equal(200, @pub.till_balance)
  end

  def test_can_take_payment
    assert_equal(205, @pub.take_payment(5))
  end

  def test_customer_has_enough_money
    assert_equal(true, @customer.can_afford_drink(@drink1))
  end

  def test_customer_does_not_have_enough_money
    # @customer1 = Customer.new("Stephen", 0, 25)
    assert_equal(false, @customer1.can_afford_drink(@drink1))
  end


  def test_check_initial_stock
    assert_equal([@drink1, @drink2, @drink3], @pub.check_stock)
  end

  def test_can_remove_drink_when_sold
    @pub.remove_drink(@drink3)
    assert_equal([@drink1, @drink2], @pub.check_stock)
  end

  def test_customer_has_zero_drunkness_initially
    assert_equal(0, @customer.drunkness())
  end

  def test_customer_has_increased_drunkness_level
    @customer.increase_drunkness(@drink1)
    assert_equal(5, @customer.drunkness())
  end

  def test_sell_drink_to_a_customer
    @pub.sell_drink(@drink1, @customer)
    assert_equal(24,@customer.wallet())
    assert_equal(206, @pub.till_balance)
    assert_equal([@drink2, @drink3], @pub.check_stock)
    assert_equal(5, @customer.drunkness)
  end

  def test_try_sell_drink_but_customer_not_enough_money
    @pub.sell_drink(@drink1, @customer1)
    assert_equal(0,@customer1.wallet())
    assert_equal(200, @pub.till_balance)
    assert_equal([@drink1, @drink2, @drink3], @pub.check_stock)
    assert_equal(0, @customer1.drunkness)
  end

  def test_try_sell_drink_but_customer_not_old_enough
    @pub.sell_drink(@drink1, @customer2)
    assert_equal(50, @customer2.wallet())
    assert_equal(200, @pub.till_balance)
    assert_equal([@drink1, @drink2, @drink3], @pub.check_stock)
    assert_equal(0, @customer2.drunkness)
  end

  def test_try_sell_drink_but_customer_too_drunk
    @pub.sell_drink(@drink1, @customer)
    @pub.sell_drink(@drink2, @customer)
    assert_equal(24, @customer.wallet())
    assert_equal(206, @pub.till_balance)
    assert_equal([@drink2, @drink3], @pub.check_stock)
    assert_equal(5, @customer.drunkness)
  end

end
