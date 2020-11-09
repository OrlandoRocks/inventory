require "application_system_test_case"

class RampTypesTest < ApplicationSystemTestCase
  setup do
    @ramp_type = ramp_types(:one)
  end

  test "visiting the index" do
    visit ramp_types_url
    assert_selector "h1", text: "Ramp Types"
  end

  test "creating a Ramp type" do
    visit ramp_types_url
    click_on "New Ramp Type"

    fill_in "Model part", with: @ramp_type.model_part
    fill_in "Name", with: @ramp_type.name
    check "Status" if @ramp_type.status
    click_on "Create Ramp type"

    assert_text "Ramp type was successfully created"
    click_on "Back"
  end

  test "updating a Ramp type" do
    visit ramp_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @ramp_type.model_part
    fill_in "Name", with: @ramp_type.name
    check "Status" if @ramp_type.status
    click_on "Update Ramp type"

    assert_text "Ramp type was successfully updated"
    click_on "Back"
  end

  test "destroying a Ramp type" do
    visit ramp_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ramp type was successfully destroyed"
  end
end
