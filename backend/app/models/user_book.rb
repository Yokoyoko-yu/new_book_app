#ユーザの登録している書籍情報
require 'composite_primary_keys'
class UserBook < ApplicationRecord
    self.primary_keys = :user_id, :isbn
    belongs_to :user
    belongs_to :book,foreign_key: :isbn,primary_key: :isbn
    validates :isbn,presence: true,length: {is:13}
    validates :user_id,presence: true
    before_validation :normalize_isbn
    def normalize_isbn
    # isbn を文字列に変換し、数字以外を除去（例: "978-4-06-293842-6" → "9784062938426"）
    self.isbn = isbn.to_s.gsub(/[^0-9]/, '') if isbn.present?
    end
end
