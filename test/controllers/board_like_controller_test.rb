require 'test_helper'

class BoardLikeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get board_like_create_url
    assert_response :success
  end

end
