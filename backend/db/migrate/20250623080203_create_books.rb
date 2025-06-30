class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books,id: false do |t|
      t.integer :isbn,primary_key: true
      t.string :author,null: false
      t.string :title,null: false
      t.string :publisher,null: false

      t.timestamps
    end
  end
end
