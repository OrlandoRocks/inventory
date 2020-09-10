require "application_system_test_case"

class TrailersTest < ApplicationSystemTestCase
  setup do
    @trailer = trailers(:one)
  end

  test "visiting the index" do
    visit trailers_url
    assert_selector "h1", text: "Trailers"
  end

  test "creating a Trailer" do
    visit trailers_url
    click_on "New Trailer"

    fill_in "Model", with: @trailer.model
    fill_in "Name", with: @trailer.name
    fill_in "Photo", with: @trailer.photo
    click_on "Create Trailer"

    assert_text "Trailer was successfully created"
    click_on "Back"
  end

  test "updating a Trailer" do
    visit trailers_url
    click_on "Edit", match: :first

    fill_in "Model", with: @trailer.model
    fill_in "Name", with: @trailer.name
    fill_in "Photo", with: @trailer.photo
    click_on "Update Trailer"

    assert_text "Trailer was successfully updated"
    click_on "Back"
  end

  test "destroying a Trailer" do
    visit trailers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trailer was successfully destroyed"
  end
end
