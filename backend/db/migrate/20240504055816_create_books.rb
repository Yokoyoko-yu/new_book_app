class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
    add_index :books,[:title,:author]
  end
end
