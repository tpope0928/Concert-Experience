class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :concert
  
    accepts_nested_attributes_for :concert

    validates :rating, presence: true
    validates :content, presence: true
    
  end
