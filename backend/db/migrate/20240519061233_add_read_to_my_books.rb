class AddReadToMyBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :my_books, :read, :integer
  end
end
