class AddHaveToMybooks < ActiveRecord::Migration[7.0]
  def change
    add_column :my_books, :have,:integer,default:0
  end
end
