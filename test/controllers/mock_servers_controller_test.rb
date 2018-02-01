require 'test_helper'

class MockServersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mock_server = mock_servers(:one)
  end

  test "should get index" do
    get mock_servers_url
    assert_response :success
  end

  test "should get new" do
    get new_mock_server_url
    assert_response :success
  end

  test "should create mock_server" do
    assert_difference('MockServer.count') do
      post mock_servers_url, params: { mock_server: {  } }
    end

    assert_redirected_to mock_server_url(MockServer.last)
  end

  test "should show mock_server" do
    get mock_server_url(@mock_server)
    assert_response :success
  end

  test "should get edit" do
    get edit_mock_server_url(@mock_server)
    assert_response :success
  end

  test "should update mock_server" do
    patch mock_server_url(@mock_server), params: { mock_server: {  } }
    assert_redirected_to mock_server_url(@mock_server)
  end

  test "should destroy mock_server" do
    assert_difference('MockServer.count', -1) do
      delete mock_server_url(@mock_server)
    end

    assert_redirected_to mock_servers_url
  end
end
