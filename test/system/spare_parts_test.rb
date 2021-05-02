require "application_system_test_case"

class SparePartsTest < ApplicationSystemTestCase
  setup do
    @spare_part = spare_parts(:one)
  end

  test "visiting the index" do
    visit spare_parts_url
    assert_selector "h1", text: "Spare Parts"
  end

  test "creating a Spare part" do
    visit spare_parts_url
    click_on "New Spare Part"

    fill_in "Instock", with: @spare_part.instock
    fill_in "Measurement", with: @spare_part.measurement
    fill_in "Sub category", with: @spare_part.sub_category_id
    fill_in "Unit cost", with: @spare_part.unit_cost
    click_on "Create Spare part"

    assert_text "Spare part was successfully created"
    click_on "Back"
  end

  test "updating a Spare part" do
    visit spare_parts_url
    click_on "Edit", match: :first

    fill_in "Instock", with: @spare_part.instock
    fill_in "Measurement", with: @spare_part.measurement
    fill_in "Sub category", with: @spare_part.sub_category_id
    fill_in "Unit cost", with: @spare_part.unit_cost
    click_on "Update Spare part"

    assert_text "Spare part was successfully updated"
    click_on "Back"
  end

  test "destroying a Spare part" do
    visit spare_parts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spare part was successfully destroyed"
  end
end
