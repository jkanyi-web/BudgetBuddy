require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'test@example1.com', password: 'password',
                     password_confirmation: 'password')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'should have many entities' do
    assert_equal @user.entities.count, 0
    # Add an entity to the user
    @user.save!
    entity = @user.entities.build(name: 'Example Entity', amount: 100)
    entity.save!
    assert_equal @user.entities.count, 1
  end
end
