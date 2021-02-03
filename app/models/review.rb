class Review < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, 
  	greater_than_or_equal_to: 0, less_than: 6}
  validates :content, presence: true
  validates :beer, uniqueness: {scope: :user, message: ": This beer has already been reviewed by you"}
end
