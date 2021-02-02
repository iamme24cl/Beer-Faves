class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_beers, through: :reviews, source: :beer
	has_many :beers
	has_secure_password
	validates :username, presence: true
	validates :email, uniqueness: true

end
