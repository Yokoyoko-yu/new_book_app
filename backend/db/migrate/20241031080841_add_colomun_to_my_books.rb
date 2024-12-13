class AddColomunToMyBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :my_books, :isbn, :string
  end
end
