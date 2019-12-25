class Concert < ApplicationRecord
    belongs_to :artist
    belongs_to :user
  
    has_many :experiences
    has_many :users, through: :experiences
  
    accepts_nested_attributes_for :artist

    validates :venue, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :date, presence: true
  end