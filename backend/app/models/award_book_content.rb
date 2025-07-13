class AwardBookContent < ApplicationRecord
    belongs_to :book,foreign_key: :isbn,primary_key: :isbn
    belongs_to :award_title
    validates :isbn,presence: true
    validates :award_title_id,presence: true
    before_validation
    def normalize_isbn
    # isbn を文字列に変換し、数字以外を除去（例: "978-4-06-293842-6" → "9784062938426"）
    self.isbn = isbn.to_s.gsub(/[^0-9]/, '') if isbn.present?
    end
end
