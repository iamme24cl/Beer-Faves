class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user
  belongs_to :brewery
  accepts_nested_attributes_for :brewery

  validates :name, presence: true
  validates :style, presence: true
  validates :tasting_notes, presence: true
end
