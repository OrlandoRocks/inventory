require "application_system_test_case"

class BrakeTypesTest < ApplicationSystemTestCase
  setup do
    @brake_type = brake_types(:one)
  end

  test "visiting the index" do
    visit brake_types_url
    assert_selector "h1", text: "Brake Types"
  end

  test "creating a Brake type" do
    visit brake_types_url
    click_on "New Brake Type"

    fill_in "Model part", with: @brake_type.model_part
    fill_in "Name", with: @brake_type.name
    check "Status" if @brake_type.status
    click_on "Create Brake type"

    assert_text "Brake type was successfully created"
    click_on "Back"
  end

  test "updating a Brake type" do
    visit brake_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @brake_type.model_part
    fill_in "Name", with: @brake_type.name
    check "Status" if @brake_type.status
    click_on "Update Brake type"

    assert_text "Brake type was successfully updated"
    click_on "Back"
  end

  test "destroying a Brake type" do
    visit brake_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brake type was successfully destroyed"
  end
end
