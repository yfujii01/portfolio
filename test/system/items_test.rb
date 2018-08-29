require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item1 = items(:one)
    @item2 = items(:one)
    @user = users(:one)
  end


  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "ポートフォリオ"
  end

  test "creating a Item" do
    # login
    login_as @user

    visit root_url
    click_on "新規作成"

    fill_in "Detail", with: @item1.detail
    fill_in "Overview", with: @item1.overview
    # fill_in "Public", with: @item.public
    check "Public" if @item1.public
    fill_in "Title", with: @item1.title
    fill_in "Url", with: @item1.url
    click_on "登録する"

    assert_text "作成しました"
    # click_on "HOMEへ"
  end

  test "updating a Item" do
    # login
    login_as @user

    visit root_url
    click_on "修正", match: :first

    fill_in "Detail", with: @item2.detail
    fill_in "Overview", with: @item2.overview
    check "Public" if @item2.public
    fill_in "Title", with: @item2.title
    fill_in "Url", with: @item2.url
    click_on "更新する"

    assert_text "更新しました"
  end

  test "destroying a Item" do
    login_as @user
    visit root_url
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "削除しました"
  end
end
