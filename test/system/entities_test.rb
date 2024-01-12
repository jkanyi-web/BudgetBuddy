require 'application_system_test_case'

class EntitiesTest < ApplicationSystemTestCase
  setup do
    @entity = entities(:one)
  end

  test 'visiting the index' do
    visit entities_url
    assert_selector 'h1', text: 'Entities', wait: 10
  end

  test 'should create entity' do
    visit entities_url
    click_on 'New entity', match: :first, wait: 10

    fill_in 'Amount', with: @entity.amount
    fill_in 'User', with: @entity.user_id
    fill_in 'Name', with: @entity.name
    click_on 'Create Entity', match: :first, wait: 10

    assert_text 'Entity was successfully created'
    click_on 'Back to entities', match: :first, wait: 10
  end

  test 'should update Entity' do
    visit entity_url(@entity)
    click_on 'Edit', match: :first, wait: 10

    fill_in 'Amount', with: @entity.amount
    fill_in 'User', with: @entity.user_id
    fill_in 'Name', with: @entity.name
    click_on 'Update Entity', match: :first, wait: 10

    assert_text 'Entity was successfully updated'
    click_on 'Back to entities', match: :first, wait: 10
  end

  test 'should destroy Entity' do
    visit entity_url(@entity)
    click_on 'Destroy', match: :first, wait: 10

    page.driver.browser.switch_to.alert.accept

    assert_text 'Entity was successfully destroyed'
  end
end
