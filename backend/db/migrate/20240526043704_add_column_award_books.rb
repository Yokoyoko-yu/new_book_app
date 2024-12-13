class AddColumnAwardBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :award_books,:status,:integer,default: 0
  end
end
