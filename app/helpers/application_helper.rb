module ApplicationHelper

	def title
		base_title = "Neoxia Ruby on Rails Tutorial"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
  
	def logo
		image_tag("neoxia.png", :alt => "Neoxia", :class => "round")
	end

end
