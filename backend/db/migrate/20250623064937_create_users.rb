class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,null:false,uniqueness:true
      t.string :name,null:false
      t.timestamps
    end
  end
end
