class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
