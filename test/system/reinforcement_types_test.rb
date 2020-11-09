require "application_system_test_case"

class ReinforcementTypesTest < ApplicationSystemTestCase
  setup do
    @reinforcement_type = reinforcement_types(:one)
  end

  test "visiting the index" do
    visit reinforcement_types_url
    assert_selector "h1", text: "Reinforcement Types"
  end

  test "creating a Reinforcement type" do
    visit reinforcement_types_url
    click_on "New Reinforcement Type"

    fill_in "Model part", with: @reinforcement_type.model_part
    fill_in "Name", with: @reinforcement_type.name
    check "Status" if @reinforcement_type.status
    click_on "Create Reinforcement type"

    assert_text "Reinforcement type was successfully created"
    click_on "Back"
  end

  test "updating a Reinforcement type" do
    visit reinforcement_types_url
    click_on "Edit", match: :first

    fill_in "Model part", with: @reinforcement_type.model_part
    fill_in "Name", with: @reinforcement_type.name
    check "Status" if @reinforcement_type.status
    click_on "Update Reinforcement type"

    assert_text "Reinforcement type was successfully updated"
    click_on "Back"
  end

  test "destroying a Reinforcement type" do
    visit reinforcement_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reinforcement type was successfully destroyed"
  end
end
