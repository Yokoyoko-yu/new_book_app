class CreateAwardGrants < ActiveRecord::Migration[7.0]
  def change
    create_table :award_grants,id: false do |t|
      t.references :award, null: false, foreign_key: true
      t.references :award_title, null: false, foreign_key: true
      t.integer :times,null: false

      t.timestamps
    end
  end
end
