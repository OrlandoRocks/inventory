require "application_system_test_case"

class TrailerWidthsTest < ApplicationSystemTestCase
  setup do
    @trailer_width = trailer_widths(:one)
  end

  test "visiting the index" do
    visit trailer_widths_url
    assert_selector "h1", text: "Trailer Widths"
  end

  test "creating a Trailer width" do
    visit trailer_widths_url
    click_on "New Trailer Width"

    fill_in "Model part", with: @trailer_width.model_part
    fill_in "Name", with: @trailer_width.name
    check "Status" if @trailer_width.status
    click_on "Create Trailer width"

    assert_text "Trailer width was successfully created"
    click_on "Back"
  end

  test "updating a Trailer width" do
    visit trailer_widths_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @trailer_width.model_part
    fill_in "Name", with: @trailer_width.name
    check "Status" if @trailer_width.status
    click_on "Update Trailer width"

    assert_text "Trailer width was successfully updated"
    click_on "Back"
  end

  test "destroying a Trailer width" do
    visit trailer_widths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trailer width was successfully destroyed"
  end
end
