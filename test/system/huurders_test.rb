require "application_system_test_case"

class HuurdersTest < ApplicationSystemTestCase
  setup do
    @huurder = huurders(:one)
  end

  test "visiting the index" do
    visit huurders_url
    assert_selector "h1", text: "Huurders"
  end

  test "should create huurder" do
    visit huurders_url
    click_on "New huurder"

    fill_in "Appointment", with: @huurder.appointment
    fill_in "Email", with: @huurder.email
    fill_in "Evaluation", with: @huurder.evaluation
    fill_in "Name", with: @huurder.name
    fill_in "Phone", with: @huurder.phone
    fill_in "Remarks", with: @huurder.remarks
    click_on "Create Huurder"

    assert_text "Huurder was successfully created"
    click_on "Back"
  end

  test "should update Huurder" do
    visit huurder_url(@huurder)
    click_on "Edit this huurder", match: :first

    fill_in "Appointment", with: @huurder.appointment
    fill_in "Email", with: @huurder.email
    fill_in "Evaluation", with: @huurder.evaluation
    fill_in "Name", with: @huurder.name
    fill_in "Phone", with: @huurder.phone
    fill_in "Remarks", with: @huurder.remarks
    click_on "Update Huurder"

    assert_text "Huurder was successfully updated"
    click_on "Back"
  end

  test "should destroy Huurder" do
    visit huurder_url(@huurder)
    click_on "Destroy this huurder", match: :first

    assert_text "Huurder was successfully destroyed"
  end
end
