module BreweriesHelper

	def display_availability(object)
		if object.in_store 
			content_tag(:p, content_tag(:b, "-- Available in Stores Now"))
		else
			content_tag(:p, content_tag(:b, "-- Not Available in Stores"))
		end
	end

end
