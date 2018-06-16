require 'test_helper'

class TodoControllerTest < ActionDispatch::IntegrationTest
  test "should get add_task" do
    get todo_add_task_url
    assert_response :success
  end

end
