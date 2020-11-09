require "application_system_test_case"

class RoofTypesTest < ApplicationSystemTestCase
  setup do
    @roof_type = roof_types(:one)
  end

  test "visiting the index" do
    visit roof_types_url
    assert_selector "h1", text: "Roof Types"
  end

  test "creating a Roof type" do
    visit roof_types_url
    click_on "New Roof Type"

    fill_in "Model part", with: @roof_type.model_part
    fill_in "Name", with: @roof_type.name
    check "Status" if @roof_type.status
    click_on "Create Roof type"

    assert_text "Roof type was successfully created"
    click_on "Back"
  end

  test "updating a Roof type" do
    visit roof_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @roof_type.model_part
    fill_in "Name", with: @roof_type.name
    check "Status" if @roof_type.status
    click_on "Update Roof type"

    assert_text "Roof type was successfully updated"
    click_on "Back"
  end

  test "destroying a Roof type" do
    visit roof_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Roof type was successfully destroyed"
  end
end
