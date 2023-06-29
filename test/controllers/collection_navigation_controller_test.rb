require "test_helper"

class CollectionNavigationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collection_navigation_index_url
    assert_response :success
  end
end
