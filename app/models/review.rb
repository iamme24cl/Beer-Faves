class Review < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :title, presence: true
  validates_inclusion_of :stars, :in => 1..5, message: "Scale of (1-5)"
  validates :content, presence: true
end
