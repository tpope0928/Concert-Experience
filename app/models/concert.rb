class Concert < ApplicationRecord
    belongs_to :artist
    belongs_to :user
  
    has_many :experiences
    has_many :users, through: :experiences
  
    accepts_nested_attributes_for :artist
  end