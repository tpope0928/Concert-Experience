class User < ApplicationRecord
    has_secure_password
    
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    
    has_many :experiences
    has_many :exp_concerts

    has_many :exp_concerts, through: :experiences, source: :concert
end
