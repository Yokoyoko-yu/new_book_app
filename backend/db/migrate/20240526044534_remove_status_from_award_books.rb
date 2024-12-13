class RemoveStatusFromAwardBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :award_books,:status,:integer
  end
end
