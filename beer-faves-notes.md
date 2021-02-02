User
	username
	email
	password_digest
	has_many reviews
	has_many reviewed_beers through reviews
	has many beers

Brewery
	name
	in_strore: boolean
	has_many beers

Beers
	name
	style
	tasting_notes
	belongs_to brewery
	belongs_to user
	has many reviews
	has_many users, through reviews

Reviews
	beer_id
	user_id
	stars
	title
	content


s