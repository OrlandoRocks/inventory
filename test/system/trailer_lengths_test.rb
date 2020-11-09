require "application_system_test_case"

class TrailerLengthsTest < ApplicationSystemTestCase
  setup do
    @trailer_length = trailer_lengths(:one)
  end

  test "visiting the index" do
    visit trailer_lengths_url
    assert_selector "h1", text: "Trailer Lengths"
  end

  test "creating a Trailer length" do
    visit trailer_lengths_url
    click_on "New Trailer Length"

    fill_in "Model part", with: @trailer_length.model_part
    fill_in "Name", with: @trailer_length.name
    check "Status" if @trailer_length.status
    click_on "Create Trailer length"

    assert_text "Trailer length was successfully created"
    click_on "Back"
  end

  test "updating a Trailer length" do
    visit trailer_lengths_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @trailer_length.model_part
    fill_in "Name", with: @trailer_length.name
    check "Status" if @trailer_length.status
    click_on "Update Trailer length"

    assert_text "Trailer length was successfully updated"
    click_on "Back"
  end

  test "destroying a Trailer length" do
    visit trailer_lengths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trailer length was successfully destroyed"
  end
end
