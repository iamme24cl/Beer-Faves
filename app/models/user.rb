class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_beers, through: :reviews, source: :beer
	has_many :beers
	
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true
	has_secure_password

end
