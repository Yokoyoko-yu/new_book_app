class CreateBookAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :award_books do |t|
      t.integer :times
      t.string :title
      t.string :author
      t.timestamps
      t.references :literary_award, null: false, foreign_key: true
    end
  end
end
