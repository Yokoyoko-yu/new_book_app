class MyBook<Book
    self.table_name = 'my_books'
    validates :read,presence: :true
    validates :title,uniqueness: { scope: :user_id }
end