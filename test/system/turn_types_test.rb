require "application_system_test_case"

class TurnTypesTest < ApplicationSystemTestCase
  setup do
    @turn_type = turn_types(:one)
  end

  test "visiting the index" do
    visit turn_types_url
    assert_selector "h1", text: "Turn Types"
  end

  test "creating a Turn type" do
    visit turn_types_url
    click_on "New Turn Type"

    fill_in "Model part", with: @turn_type.model_part
    fill_in "Name", with: @turn_type.name
    check "Status" if @turn_type.status
    click_on "Create Turn type"

    assert_text "Turn type was successfully created"
    click_on "Back"
  end

  test "updating a Turn type" do
    visit turn_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @turn_type.model_part
    fill_in "Name", with: @turn_type.name
    check "Status" if @turn_type.status
    click_on "Update Turn type"

    assert_text "Turn type was successfully updated"
    click_on "Back"
  end

  test "destroying a Turn type" do
    visit turn_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Turn type was successfully destroyed"
  end
end
