class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user
  belongs_to :brewery
  # accepts_nested_attributes_for :brewery

  validates :name, presence: true
  validates :style, presence: true
  validates :tasting_notes, presence: true
  
  validate :not_a_duplicate


  def brewery_attributes=(attributes)
  	brewery = Brewery.find_or_create_by(attributes) if !attributes['name'].blank?
  end

  def not_a_duplicate
  	if Beer.find_by(name: self.name, style: self.style, brewery_id: self.brewery_id)
  		errors.add(:style, "- This style of beer by #{self.brewery.name} has already been added.")
  	end
  end
end
