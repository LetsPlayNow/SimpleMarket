require 'test_helper'

class ShoppingCartsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @user = User.create(email: "system112@gmail.ru", password: "12345667")
  end

  test "should get show" do
    get :show
    assert_response :redirect

    sign_in(@user)
    get :show
    assert_response :success
  end

  test "should not add item to cart" do
    # Too many items to purchase
    sign_in(@user)
    product = Product.first
    post :add_item, id: product.id, amount: product.amount+1
    assert_not_nil(flash[:buy_danger])
  end

  test "should add item to cart" do
    # Good items to purchase
    sign_in(@user)
    product = Product.first
    post :add_item, id: product.id, amount: product.amount
    assert_nil(flash[:buy_danger])
  end
end
