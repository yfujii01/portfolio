require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item1 = items(:one)
    @item2 = items(:one)
    @user = users(:one)
  end


  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    # login
    login_as @user

    visit items_url
    click_on "New Item"

    fill_in "Detail", with: @item1.detail
    fill_in "Overview", with: @item1.overview
    # fill_in "Public", with: @item.public
    check "Public" if @item1.public
    fill_in "Title", with: @item1.title
    fill_in "Url", with: @item1.url
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    # login
    login_as @user

    visit items_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @item2.detail
    fill_in "Overview", with: @item2.overview
    check "Public" if @item2.public
    fill_in "Title", with: @item2.title
    fill_in "Url", with: @item2.url
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
