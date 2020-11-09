require "application_system_test_case"

class TrailerHeightsTest < ApplicationSystemTestCase
  setup do
    @trailer_height = trailer_heights(:one)
  end

  test "visiting the index" do
    visit trailer_heights_url
    assert_selector "h1", text: "Trailer Heights"
  end

  test "creating a Trailer height" do
    visit trailer_heights_url
    click_on "New Trailer Height"

    fill_in "Model part", with: @trailer_height.model_part
    fill_in "Name", with: @trailer_height.name
    check "Status" if @trailer_height.status
    click_on "Create Trailer height"

    assert_text "Trailer height was successfully created"
    click_on "Back"
  end

  test "updating a Trailer height" do
    visit trailer_heights_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @trailer_height.model_part
    fill_in "Name", with: @trailer_height.name
    check "Status" if @trailer_height.status
    click_on "Update Trailer height"

    assert_text "Trailer height was successfully updated"
    click_on "Back"
  end

  test "destroying a Trailer height" do
    visit trailer_heights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trailer height was successfully destroyed"
  end
end
