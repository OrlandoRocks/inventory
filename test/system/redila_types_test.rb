require "application_system_test_case"

class RedilaTypesTest < ApplicationSystemTestCase
  setup do
    @redila_type = redila_types(:one)
  end

  test "visiting the index" do
    visit redila_types_url
    assert_selector "h1", text: "Redila Types"
  end

  test "creating a Redila type" do
    visit redila_types_url
    click_on "New Redila Type"

    fill_in "Model part", with: @redila_type.model_part
    fill_in "Name", with: @redila_type.name
    check "Status" if @redila_type.status
    click_on "Create Redila type"

    assert_text "Redila type was successfully created"
    click_on "Back"
  end

  test "updating a Redila type" do
    visit redila_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @redila_type.model_part
    fill_in "Name", with: @redila_type.name
    check "Status" if @redila_type.status
    click_on "Update Redila type"

    assert_text "Redila type was successfully updated"
    click_on "Back"
  end

  test "destroying a Redila type" do
    visit redila_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Redila type was successfully destroyed"
  end
end
