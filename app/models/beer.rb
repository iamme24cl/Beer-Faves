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

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alpha
    order(name: :asc)
  end

  def brewery_attributes=(attributes)
  	brewery = Brewery.find_or_create_by(attributes) if !attributes['name'].blank?
  end

  def not_a_duplicate
  	if Beer.find_by(name: self.name, style: self.style, brewery_id: self.brewery_id)
  		errors.add(:style, "- This style of beer by #{self.brewery.name} has already been added.")
  	end
  end

  def name_and_brewery
    "#{name} - #{brewery.name}"
  end

  def avg_rating
    stars = []
    self.reviews.each do |review|
      stars << review.stars
    end
    avg_stars = stars.sum(0.0) / stars.size
  end

 
end
