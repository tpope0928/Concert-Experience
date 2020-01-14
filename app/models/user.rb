class User < ApplicationRecord
    has_secure_password
    
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    
    has_many :experiences
    has_many :exp_concerts

    has_many :exp_concerts, through: :experiences, source: :concert

    def self.from_omniauth(auth)
        #Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          if auth.info.uid
            user.uid = auth.info.uid
          end
          user.password = SecureRandom.hex
        end
      end
    end