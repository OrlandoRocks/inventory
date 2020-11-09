require "application_system_test_case"

class TrailerTypesTest < ApplicationSystemTestCase
  setup do
    @trailer_type = trailer_types(:one)
  end

  test "visiting the index" do
    visit trailer_types_url
    assert_selector "h1", text: "Trailer Types"
  end

  test "creating a Trailer type" do
    visit trailer_types_url
    click_on "New Trailer Type"

    fill_in "Image", with: @trailer_type.image
    fill_in "Name", with: @trailer_type.name
    check "Status" if @trailer_type.status
    click_on "Create Trailer type"

    assert_text "Trailer type was successfully created"
    click_on "Back"
  end

  test "updating a Trailer type" do
    visit trailer_types_url
    click_on "Edit", match: :first

    fill_in "Image", with: @trailer_type.image
    fill_in "Name", with: @trailer_type.name
    check "Status" if @trailer_type.status
    click_on "Update Trailer type"

    assert_text "Trailer type was successfully updated"
    click_on "Back"
  end

  test "destroying a Trailer type" do
    visit trailer_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trailer type was successfully destroyed"
  end
end
