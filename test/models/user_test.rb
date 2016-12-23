require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create cart" do
    user = User.create(email: "staff@gmail.ru", password: "1231312312")
    user.save
    assert_not_equal(nil, user.shopping_cart(true))
  end
end
