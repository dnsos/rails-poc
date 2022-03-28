require 'test_helper'

class FocusGroupsControllerTest < ActionDispatch::IntegrationTest
  setup { @focus_group = focus_groups(:one) }

  test 'should get show' do
    get focus_group_url(@focus_group)
    assert_response :success
  end
end
