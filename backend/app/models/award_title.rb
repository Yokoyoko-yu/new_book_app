class AwardTitle < ApplicationRecord
    has_many :award_book_contents
    validates :id,presence: false
    validates :author,presence: true
    validates :title,presence: true
end
