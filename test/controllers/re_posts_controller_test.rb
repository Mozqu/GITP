require 'test_helper'

class RePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get re_posts_index_url
    assert_response :success
  end

end
