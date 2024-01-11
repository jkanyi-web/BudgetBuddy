require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @group = groups(:one)
  end

  test 'should get index' do
    get groups_url
    assert_response :success
  end


  test 'should get new' do
    get new_group_url
    assert_response :success
  end

  test 'should create group' do
    assert_difference('Group.count') do
      post groups_url, params: { group: { name: 'NewGroup', icon: 'NewIcon' } }
    end

    assert_redirected_to group_url(Group.last)
    assert_equal 'Group was successfully created.', flash[:notice]
  end

  test 'should show group' do
    get group_url(@group)
    assert_response :success
  end

  test 'should get edit' do
    get edit_group_url(@group)
    assert_response :success
  end

  test 'should update group' do
    patch group_url(@group), params: { group: { name: 'UpdatedName', icon: 'UpdatedIcon' } }
    assert_redirected_to group_url(@group)
    assert_equal 'Group was successfully updated.', flash[:notice]
  end

  test 'should destroy group' do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
    assert_equal 'Group was successfully destroyed.', flash[:notice]
  end
end
