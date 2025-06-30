class CreateAwardBookContents < ActiveRecord::Migration[7.0]
  def change
    create_table :award_book_contents,id: false do |t|
      t.integer :isbn,null: false
      t.references :award_title,null: false,foreign_key: true

      t.timestamps
    end
    add_foreign_key :award_book_contents,:books,column: :isbn,primary_key: :isbn
  end
end
