require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food.rb')


class FoodTest < MiniTest::Test

  def setup
    @food = Food.new("Burger", 10, 3)
  end

  def test_food_has_name
    assert_equal("Burger", @food.name)
  end

  def test_food_has_price
    assert_equal(10, @food.price)
  end

  def test_food_has_rejuvination_level
    assert_equal(3, @food.rejuvination_level)
  end

end
