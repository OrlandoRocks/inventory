require "application_system_test_case"

class StatusShippingsTest < ApplicationSystemTestCase
  setup do
    @status_shipping = status_shippings(:one)
  end

  test "visiting the index" do
    visit status_shippings_url
    assert_selector "h1", text: "Status Shippings"
  end

  test "creating a Status shipping" do
    visit status_shippings_url
    click_on "New Status Shipping"

    click_on "Create Status shipping"

    assert_text "Status shipping was successfully created"
    click_on "Back"
  end

  test "updating a Status shipping" do
    visit status_shippings_url
    click_on "Edit", match: :first

    click_on "Update Status shipping"

    assert_text "Status shipping was successfully updated"
    click_on "Back"
  end

  test "destroying a Status shipping" do
    visit status_shippings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Status shipping was successfully destroyed"
  end
end
