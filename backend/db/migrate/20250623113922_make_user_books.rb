class MakeUserBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_books,id: false do |t|
      t.references :user,null: false,foreign_key: true
      t.integer :isbn,null: false

      t.timestamps
    end
    add_foreign_key :user_books,:books,column: :isbn,primary_key: :isbn
  end
end

