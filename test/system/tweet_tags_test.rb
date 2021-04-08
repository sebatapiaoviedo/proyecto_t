require "application_system_test_case"

class TweetTagsTest < ApplicationSystemTestCase
  setup do
    @tweet_tag = tweet_tags(:one)
  end

  test "visiting the index" do
    visit tweet_tags_url
    assert_selector "h1", text: "Tweet Tags"
  end

  test "creating a Tweet tag" do
    visit tweet_tags_url
    click_on "New Tweet Tag"

    fill_in "Tag", with: @tweet_tag.tag_id
    fill_in "Tweet", with: @tweet_tag.tweet_id
    click_on "Create Tweet tag"

    assert_text "Tweet tag was successfully created"
    click_on "Back"
  end

  test "updating a Tweet tag" do
    visit tweet_tags_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @tweet_tag.tag_id
    fill_in "Tweet", with: @tweet_tag.tweet_id
    click_on "Update Tweet tag"

    assert_text "Tweet tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Tweet tag" do
    visit tweet_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tweet tag was successfully destroyed"
  end
end
