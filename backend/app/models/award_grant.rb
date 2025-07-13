class AwardGrant < ApplicationRecord
    belongs_to :award
    belongs_to :award_title
    validates :award_id,presence: true
    validates :award_title,presence: true
    validates :times,presence: true
end
