class CreateAwardTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :award_titles do |t|
      t.string :title,null: false
      t.string :author,null: false

      t.timestamps
    end
  end
end
