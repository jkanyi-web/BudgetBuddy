class AddUserIdToCategories < ActiveRecord::Migration[6.0]
  def up
    add_reference :categories, :user, null: true, foreign_key: true
  end

  def down
    remove_reference :categories, :user
  end
end
