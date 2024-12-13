class CreateLiteraryAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :literary_awards do |t|
      t.string :name
      t.integer :total

      t.timestamps
    end
  end
end
