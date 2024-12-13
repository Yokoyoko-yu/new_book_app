class AddImageColomunToMyBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :my_books, :image, :binary
  end
end
