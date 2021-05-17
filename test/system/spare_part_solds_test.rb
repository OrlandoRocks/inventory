require "application_system_test_case"

class SparePartSoldsTest < ApplicationSystemTestCase
  setup do
    @spare_part_sold = spare_part_solds(:one)
  end

  test "visiting the index" do
    visit spare_part_solds_url
    assert_selector "h1", text: "Spare Part Solds"
  end

  test "creating a Spare part sold" do
    visit spare_part_solds_url
    click_on "New Spare Part Sold"

    fill_in "Advance payment", with: @spare_part_sold.advance_payment
    fill_in "Client", with: @spare_part_sold.client_id
    fill_in "Fiscal voucher", with: @spare_part_sold.fiscal_voucher_id
    fill_in "Payment type", with: @spare_part_sold.payment_type
    fill_in "Quantity", with: @spare_part_sold.quantity
    fill_in "Spare part", with: @spare_part_sold.spare_part_id
    fill_in "Unit sale price", with: @spare_part_sold.unit_sale_price
    fill_in "User", with: @spare_part_sold.user_id
    click_on "Create Spare part sold"

    assert_text "Spare part sold was successfully created"
    click_on "Back"
  end

  test "updating a Spare part sold" do
    visit spare_part_solds_url
    click_on "Edit", match: :first

    fill_in "Advance payment", with: @spare_part_sold.advance_payment
    fill_in "Client", with: @spare_part_sold.client_id
    fill_in "Fiscal voucher", with: @spare_part_sold.fiscal_voucher_id
    fill_in "Payment type", with: @spare_part_sold.payment_type
    fill_in "Quantity", with: @spare_part_sold.quantity
    fill_in "Spare part", with: @spare_part_sold.spare_part_id
    fill_in "Unit sale price", with: @spare_part_sold.unit_sale_price
    fill_in "User", with: @spare_part_sold.user_id
    click_on "Update Spare part sold"

    assert_text "Spare part sold was successfully updated"
    click_on "Back"
  end

  test "destroying a Spare part sold" do
    visit spare_part_solds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spare part sold was successfully destroyed"
  end
end
