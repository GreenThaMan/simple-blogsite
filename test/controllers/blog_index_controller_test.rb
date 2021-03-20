require "test_helper"

class BlogIndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_index_index_url
    assert_response :success
  end
end
