require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @user.save!
    sign_in @user

    @entity = entities(:one)
    @entity.author = @user
    @entity.save!
  end

  test 'should get index' do
    sign_in @user
    get entities_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_entity_url
    assert_response :success
  end

  test 'should create entity' do
    sign_in @user
    assert_difference('Entity.count') do
      post entities_url,
           params: { entity: { author_id: @user.id, name: @entity.name, amount: @entity.amount,
                               created_at: @entity.created_at } }
    end

    assert_redirected_to entity_url(Entity.last)
  end

  test 'should show entity' do
    sign_in @user
    get entity_url(@entity)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_entity_url(@entity)
    assert_response :success
  end

  test 'should update entity' do
    sign_in @user
    patch entity_url(@entity),
          params: { entity: { author_id: @entity.author_id, name: @entity.name, amount: @entity.amount,
                              created_at: @entity.created_at } }
    assert_redirected_to entity_url(@entity)
  end

  test 'should destroy entity' do
    sign_in @user
    assert_difference('Entity.count', -1) do
      delete entity_url(@entity)
    end

    assert_redirected_to entities_url
  end
end
