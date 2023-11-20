require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
    mod_res = rand(10) % 2
    is_even = 0
    assert_equal mod_res, is_even, "Expected mod to be even"
  end

  test "should create article" do
    visit articles_url
    click_on "New article"

    fill_in "Content", with: @article.content
    fill_in "Title", with: @article.title
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit article_url(@article)
    click_on "Edit this article", match: :first

    fill_in "Content", with: "Edit content"
    fill_in "Title", with: "Edit title"
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"

    page.driver.wait_for_network_idle
    assert_text "Edit content"
    assert_text "Edit title"
  end

  test "should destroy Article" do
    visit article_url(@article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
