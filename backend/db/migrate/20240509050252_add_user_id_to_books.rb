class AddUserIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :user, null: false, foreign_key: true
    add_index :books, [:user_id, :created_at]
  end
end
