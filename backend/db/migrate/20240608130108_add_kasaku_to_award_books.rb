class AddKasakuToAwardBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :award_books, :kasaku, :integer,default:0
  end
end
