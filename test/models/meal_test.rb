require 'test_helper'

class MealTest < ActiveSupport::TestCase
  fixtures :users, :meals

  test "meal attributes should be present" do
    @user = User.find(users(:diego).id)
    @meal = Meal.new(user_id: @user.id)
    assert @meal.invalid?
  end

  test "meal price must be positive" do
    @user = User.find(users(:diego).id)
    @meal = Meal.new(user_id: @user.id,
                     name: 'Meal XYZ',
                     ingredients: "Obtuse, rubber goose, green moose, guava juice, giant snake, birthday cake, large fries, chocolate shake",
                     servings_minimum: 25,
                     cover_image: nil)
    @meal.price_minimum = -1
    assert @meal.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      @meal.errors[:price_minimum]

    @meal.price_minimum = 0
    assert @meal.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      @meal.errors[:price_minimum]

    @meal.price_minimum = 0.01
    assert @meal.valid?
  end

  test "meal serving size must be at least 1" do
    @user = User.find(users(:diego).id)
    @meal = Meal.new(user_id: @user.id,
                     name: 'Meal XYZ',
                     ingredients: "Obtuse, rubber goose, green moose, guava juice, giant snake, birthday cake, large fries, chocolate shake",
                     price_minimum: 10,
                     cover_image: nil)
    @meal.servings_minimum = -1
    assert @meal.invalid?
    assert_equal ["must be greater than or equal to 1"],
      @meal.errors[:servings_minimum]

    @meal.servings_minimum = 0
    assert @meal.invalid?
    assert_equal ["must be greater than or equal to 1"],
      @meal.errors[:servings_minimum]

    @meal.servings_minimum = 1
    assert @meal.valid?
  end

  test "meal is not valid without a unique name" do
    @user = User.find(users(:diego).id)
    @meal = Meal.new(name: 'Sunday Morning Jackfruit Carnitas',
                     ingredients: "Slow Roasted Jackfruit, cilantro, onion, lime, salsa",
                     servings_minimum: 5,
                     price_minimum: 40.00,
                     cover_image: 'img1.jpg',
                     user_id: @user.id)
    assert @meal.invalid?
    assert_equal ["has already been taken"], @meal.errors[:name]
  end

  test "meal should be valid" do
    @user = User.find(users(:diego).id)
    @meal = Meal.new(name: 'Meal XYZ',
                     ingredients: "Obtuse, rubber goose, green moose, guava juice, giant snake, birthday cake, large fries, chocolate shake",
                     servings_minimum: 25,
                     price_minimum: 80.00,
                     cover_image: 'img1.jpg',
                     user_id: @user.id)
    assert @meal.valid?
  end
end
