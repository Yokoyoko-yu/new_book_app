class ChangeMyBooksImage < ActiveRecord::Migration[7.0]
  def change
    change_column :my_books,:image,:string
  end
end
