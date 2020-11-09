require "application_system_test_case"

class FenderTypesTest < ApplicationSystemTestCase
  setup do
    @fender_type = fender_types(:one)
  end

  test "visiting the index" do
    visit fender_types_url
    assert_selector "h1", text: "Fender Types"
  end

  test "creating a Fender type" do
    visit fender_types_url
    click_on "New Fender Type"

    fill_in "Model part", with: @fender_type.model_part
    fill_in "Name", with: @fender_type.name
    check "Status" if @fender_type.status
    click_on "Create Fender type"

    assert_text "Fender type was successfully created"
    click_on "Back"
  end

  test "updating a Fender type" do
    visit fender_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @fender_type.model_part
    fill_in "Name", with: @fender_type.name
    check "Status" if @fender_type.status
    click_on "Update Fender type"

    assert_text "Fender type was successfully updated"
    click_on "Back"
  end

  test "destroying a Fender type" do
    visit fender_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fender type was successfully destroyed"
  end
end
