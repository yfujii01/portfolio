require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @item1 = items(:one)
    @user = users( :one )
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    # login
    login_as @user

    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { detail: @item1.detail, overview: @item1.overview, public: @item1.public, title: @item1.title, url: @item1.url, user: users(:one) } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item1)
    assert_response :success
  end

  test "should get edit" do
    # login
    login_as @user

    get edit_item_url(@item1)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item1), params: { item: { detail: @item1.detail, overview: @item1.overview, public: @item1.public, title: @item1.title, url: @item1.url, user: users(:one) } }
    assert_redirected_to item_url(@item1)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item1)
    end

    assert_redirected_to items_url
  end
end
