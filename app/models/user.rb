class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_beers, through: :reviews, source: :beer
	has_many :beers
	
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true
	has_secure_password

	def self.user_by_omniauth(auth)
		self.find_or_create_by(email: auth['info']['email']) do |u|
			u.username = auth['info']['name']
			u.password = SecureRandom.hex
		end							
	end

end
