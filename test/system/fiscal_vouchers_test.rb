require "application_system_test_case"

class FiscalVouchersTest < ApplicationSystemTestCase
  setup do
    @fiscal_voucher = fiscal_vouchers(:one)
  end

  test "visiting the index" do
    visit fiscal_vouchers_url
    assert_selector "h1", text: "Fiscal Vouchers"
  end

  test "creating a Fiscal voucher" do
    visit fiscal_vouchers_url
    click_on "New Fiscal Voucher"

    fill_in "Name", with: @fiscal_voucher.name
    check "Status" if @fiscal_voucher.status
    click_on "Create Fiscal voucher"

    assert_text "Fiscal voucher was successfully created"
    click_on "Back"
  end

  test "updating a Fiscal voucher" do
    visit fiscal_vouchers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fiscal_voucher.name
    check "Status" if @fiscal_voucher.status
    click_on "Update Fiscal voucher"

    assert_text "Fiscal voucher was successfully updated"
    click_on "Back"
  end

  test "destroying a Fiscal voucher" do
    visit fiscal_vouchers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fiscal voucher was successfully destroyed"
  end
end
