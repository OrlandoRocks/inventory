require "application_system_test_case"

class PullTypesTest < ApplicationSystemTestCase
  setup do
    @pull_type = pull_types(:one)
  end

  test "visiting the index" do
    visit pull_types_url
    assert_selector "h1", text: "Pull Types"
  end

  test "creating a Pull type" do
    visit pull_types_url
    click_on "New Pull Type"

    fill_in "Model part", with: @pull_type.model_part
    fill_in "Name", with: @pull_type.name
    check "Status" if @pull_type.status
    click_on "Create Pull type"

    assert_text "Pull type was successfully created"
    click_on "Back"
  end

  test "updating a Pull type" do
    visit pull_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @pull_type.model_part
    fill_in "Name", with: @pull_type.name
    check "Status" if @pull_type.status
    click_on "Update Pull type"

    assert_text "Pull type was successfully updated"
    click_on "Back"
  end

  test "destroying a Pull type" do
    visit pull_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pull type was successfully destroyed"
  end
end
