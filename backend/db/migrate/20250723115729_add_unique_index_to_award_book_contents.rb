class AddUniqueIndexToAwardBookContents < ActiveRecord::Migration[7.0]
  def change
    add_index :award_book_contents, [:isbn, :award_title_id], unique: true
  end
end
