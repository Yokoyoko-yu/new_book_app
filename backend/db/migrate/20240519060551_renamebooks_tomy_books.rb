class RenamebooksTomyBooks < ActiveRecord::Migration[7.0]
  def change
    rename_table :books,:my_books
  end
end
