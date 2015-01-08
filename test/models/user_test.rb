require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should validate when age absent" do
    user = User.new(name: 'john')
    assert user.valid?
  end

  test "should have integer numerical age if any" do
    user = User.new(name: 'john', age: 2.5)
    assert_not user.valid?
    assert_equal ["must be an integer"], user.errors.messages[:age]
  end

  test "should have numerical age if any" do
    user = User.new(name: 'john', age: 'aaa')
    assert_not user.valid?
    assert_equal ["is not a number"], user.errors.messages[:age]
  end

  test "should have positive, numerical age if any" do
    user = User.new(name: 'john', age: 0)
    assert_not user.valid?
    assert_equal ["must be greater than 0"], user.errors.messages[:age]
  end

  test "should skip nil fields" do
    user = User.new(name: 'john', age: nil).as_json
    assert_not user.has_key? "age"
  end
end
