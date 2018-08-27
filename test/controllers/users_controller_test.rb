require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users( :one )
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get user_url(@user)
    assert_response :success
  end

end
