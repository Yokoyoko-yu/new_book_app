class LiteraryAward < ApplicationRecord
    has_many :award_books
    validates :name,presence: true
    validates :total,presence: true
end
