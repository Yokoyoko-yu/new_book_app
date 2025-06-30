class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.string :name,null: false
      t.integer :total,null: false

      t.timestamps
    end
  end
end
