require "application_system_test_case"

class HydraulicJacksTest < ApplicationSystemTestCase
  setup do
    @hydraulic_jack = hydraulic_jacks(:one)
  end

  test "visiting the index" do
    visit hydraulic_jacks_url
    assert_selector "h1", text: "Hydraulic Jacks"
  end

  test "creating a Hydraulic jack" do
    visit hydraulic_jacks_url
    click_on "New Hydraulic Jack"

    fill_in "Model part", with: @hydraulic_jack.model_part
    fill_in "Name", with: @hydraulic_jack.name
    check "Status" if @hydraulic_jack.status
    click_on "Create Hydraulic jack"

    assert_text "Hydraulic jack was successfully created"
    click_on "Back"
  end

  test "updating a Hydraulic jack" do
    visit hydraulic_jacks_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @hydraulic_jack.model_part
    fill_in "Name", with: @hydraulic_jack.name
    check "Status" if @hydraulic_jack.status
    click_on "Update Hydraulic jack"

    assert_text "Hydraulic jack was successfully updated"
    click_on "Back"
  end

  test "destroying a Hydraulic jack" do
    visit hydraulic_jacks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hydraulic jack was successfully destroyed"
  end
end
