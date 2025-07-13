class Award < ApplicationRecord
    has_many :award_grants
    validates :id,presence: true,uniqueness: true
    validates :name,presence: true,uniqueness: true
    validates :total,presence: true
end
