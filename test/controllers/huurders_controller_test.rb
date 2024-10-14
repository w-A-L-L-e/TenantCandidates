require "test_helper"

class HuurdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @huurder = huurders(:one)
  end

  test "should get index" do
    get huurders_url
    assert_response :success
  end

  test "should get new" do
    get new_huurder_url
    assert_response :success
  end

  test "should create huurder" do
    assert_difference("Huurder.count") do
      post huurders_url, params: { huurder: { appointment: @huurder.appointment, email: @huurder.email, evaluation: @huurder.evaluation, name: @huurder.name, phone: @huurder.phone, remarks: @huurder.remarks } }
    end

    assert_redirected_to huurder_url(Huurder.last)
  end

  test "should show huurder" do
    get huurder_url(@huurder)
    assert_response :success
  end

  test "should get edit" do
    get edit_huurder_url(@huurder)
    assert_response :success
  end

  test "should update huurder" do
    patch huurder_url(@huurder), params: { huurder: { appointment: @huurder.appointment, email: @huurder.email, evaluation: @huurder.evaluation, name: @huurder.name, phone: @huurder.phone, remarks: @huurder.remarks } }
    assert_redirected_to huurder_url(@huurder)
  end

  test "should destroy huurder" do
    assert_difference("Huurder.count", -1) do
      delete huurder_url(@huurder)
    end

    assert_redirected_to huurders_url
  end
end
