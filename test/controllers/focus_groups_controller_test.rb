require 'test_helper'

class FocusGroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get focus_groups_show_url
    assert_response :success
  end
end
