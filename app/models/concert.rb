class Concert < ApplicationRecord
    belongs_to :artist
    belongs_to :user
  
    has_many :experiences
    has_many :users, through: :experiences
  
    accepts_nested_attributes_for :artist

    validates :venue, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :date, presence: true, uniqueness: { scope: :date, message: "already taken" }
    
    #validate :not_a_duplicate

    def artist_attributes=(attributes)
      self.artist = Artist.find_or_create_by(attributes) if !attributes['name'].empty?
      self.artist
    end

    #def not_a_duplicate
     # concert = Concert.find_by(date: date, artist_id: artist_id)
      #if !!date && date != self
       # errors.add(:artist, 'Concert has been added for this date')
      #end
    #end

    #def artist_name
     # artist.try(:name)
    #end

    #def date_and_artist
     # "#{date} - #{artist.try(:name)}"
    #end
  end