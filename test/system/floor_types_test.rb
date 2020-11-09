require "application_system_test_case"

class FloorTypesTest < ApplicationSystemTestCase
  setup do
    @floor_type = floor_types(:one)
  end

  test "visiting the index" do
    visit floor_types_url
    assert_selector "h1", text: "Floor Types"
  end

  test "creating a Floor type" do
    visit floor_types_url
    click_on "New Floor Type"

    fill_in "Model part", with: @floor_type.model_part
    fill_in "Name", with: @floor_type.name
    check "Status" if @floor_type.status
    click_on "Create Floor type"

    assert_text "Floor type was successfully created"
    click_on "Back"
  end

  test "updating a Floor type" do
    visit floor_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @floor_type.model_part
    fill_in "Name", with: @floor_type.name
    check "Status" if @floor_type.status
    click_on "Update Floor type"

    assert_text "Floor type was successfully updated"
    click_on "Back"
  end

  test "destroying a Floor type" do
    visit floor_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Floor type was successfully destroyed"
  end
end
