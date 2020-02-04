class Artist < ApplicationRecord
    has_many :concerts
    has_many :users, through: :concerts

    validates :name, presence: true
    validates :genre, presence: true
end
