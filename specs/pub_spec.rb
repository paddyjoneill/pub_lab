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

  def test_check_initial_stock
    assert_equal([@drink1, @drink2, @drink3], @pub.check_stock)
  end

  def test_can_remove_drink_when_sold
    @pub.remove_drink(@drink3)
    assert_equal([@drink1, @drink2], @pub.check_stock)
  end

end
