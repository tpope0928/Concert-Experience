class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :concert
  
    accepts_nested_attributes_for :concert

    validates :rating, :numericality: true, greater_than_or_equal_to: 0, less_than: 6
  end
