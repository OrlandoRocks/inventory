require "application_system_test_case"

class SuspensionTypesTest < ApplicationSystemTestCase
  setup do
    @suspension_type = suspension_types(:one)
  end

  test "visiting the index" do
    visit suspension_types_url
    assert_selector "h1", text: "Suspension Types"
  end

  test "creating a Suspension type" do
    visit suspension_types_url
    click_on "New Suspension Type"

    fill_in "Model part", with: @suspension_type.model_part
    fill_in "Name", with: @suspension_type.name
    check "Status" if @suspension_type.status
    click_on "Create Suspension type"

    assert_text "Suspension type was successfully created"
    click_on "Back"
  end

  test "updating a Suspension type" do
    visit suspension_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @suspension_type.model_part
    fill_in "Name", with: @suspension_type.name
    check "Status" if @suspension_type.status
    click_on "Update Suspension type"

    assert_text "Suspension type was successfully updated"
    click_on "Back"
  end

  test "destroying a Suspension type" do
    visit suspension_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Suspension type was successfully destroyed"
  end
end
