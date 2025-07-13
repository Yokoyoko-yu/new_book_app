#書籍情報
class Book < ApplicationRecord
    has_many :user_books
    has_many :award_book_contents
validates :isbn,presence: true,uniqueness: true,length:{is:13}
    validates :author,presence: true
    validates :title,presence: true
    validates :publisher,presence: true
    before_validation :normalize_isbn
    def normalize_isbn
    # isbn を文字列に変換し、数字以外を除去（例: "978-4-06-293842-6" → "9784062938426"）
    self.isbn = isbn.to_s.gsub(/[^0-9]/, '') if isbn.present?
    end
end
