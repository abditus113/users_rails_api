require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should return proper json table" do
    users_json = User.all.to_json(except: [:created_at, :updated_at])
    get :index
    assert_equal response.body, users_json
  end
end
