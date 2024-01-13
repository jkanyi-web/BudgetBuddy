require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @user = users(:one)
    sign_in @user
    @icon = fixture_file_upload('icon.png', 'image/png')
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'New Category', icon: @icon } } # Modify this line
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should show category' do
    get category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch category_url(@category), params: { category: { name: 'Updated Category', icon: @icon } } # Modify this line
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  test 'should not create category with blank name' do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: '', icon: @icon } }
    end

    assert_response :unprocessable_entity
  end

  test 'should not update category with blank name' do
    patch category_url(@category), params: { category: { name: '', icon: @icon } }
    assert_response :unprocessable_entity
  end
end
