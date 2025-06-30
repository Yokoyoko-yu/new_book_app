class Award < ApplicationRecord
    has_many :award_grants
    validates :award_id,presence :true,uniqueness :true
    validates :name,presence :true,uniqueness :true
    validates :total,presence :true
end
