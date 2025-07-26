class AddUniqueIndexToAwardGrants < ActiveRecord::Migration[7.0]
  def change
    add_index :award_grants, [:award_id, :award_title_id], unique: true
  end
end
