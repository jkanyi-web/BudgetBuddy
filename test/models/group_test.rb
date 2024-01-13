require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: 'Example User', email: "test#{rand(1000)}@example.com", password: 'password',
                         password_confirmation: 'password')
    @group = @user.groups.build(name: 'Example Group', icon: 'example_icon')
  end

  test 'should be valid' do
    assert @group.valid?
  end

  test 'name should be present' do
    @group.name = ''
    assert_not @group.valid?
  end

  test 'icon should be present' do
    @group.icon = ''
    assert_not @group.valid?
  end

  test 'should have many entities' do
    assert_equal @group.entities.count, 0
    # Add an entity to the group
    user = User.create!(name: 'Test User', email: "test#{rand(1000)}@example.com", password: 'password')
    entity = Entity.create!(name: 'Example Entity', amount: 100, author: user)
    @group.entities << entity
    @group.save!
    assert_equal @group.entities.count, 1
  end
end
