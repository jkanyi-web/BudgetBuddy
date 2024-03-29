require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: 'Example User', email: "test#{rand(1000)}@example.com", password: 'password',
                         password_confirmation: 'password')
    @entity = @user.entities.build(name: 'Example Entity', amount: 100)
  end

  test 'should be valid' do
    assert @entity.valid?
  end

  test 'name should be present' do
    @entity.name = ''
    assert_not @entity.valid?
  end

  test 'amount should be present' do
    @entity.amount = nil
    assert_not @entity.valid?
  end

  test 'should belong to a user' do
    assert @entity.author
  end

  test 'should have many groups' do
    assert_equal @entity.groups.count, 0
    # Add a group to the entity
    group = @user.groups.create!(name: 'Example Group', icon: 'example_icon')
    @entity.groups << group
    @entity.save!
    assert_equal @entity.groups.count, 1
  end
end
