require "test_helper"

class ScrapingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scraping_index_url
    assert_response :success
  end
end
