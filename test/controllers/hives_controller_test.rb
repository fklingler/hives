require "test_helper"

class HivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hive = hives(:one)
  end

  test "should get index" do
    get hives_url, as: :json
    assert_response :success
  end

  test "should create hive" do
    assert_difference("Hive.count") do
      post hives_url, params: { hive: { name: @hive.name, weight: @hive.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show hive" do
    get hive_url(@hive), as: :json
    assert_response :success
  end

  test "should update hive" do
    patch hive_url(@hive), params: { hive: { name: @hive.name, weight: @hive.weight } }, as: :json
    assert_response :success
  end

  test "should destroy hive" do
    assert_difference("Hive.count", -1) do
      delete hive_url(@hive), as: :json
    end

    assert_response :no_content
  end
end
