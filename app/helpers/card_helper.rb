module CardHelper
	def instagram_id(username)
		Instagram.user_search(username,count:1)[0]['id']
	end

	def classify(card)
		classes = []

		# Filter classes
		
		classes << "twitter" unless card.twitter_handle.to_s == ""
		classes << "instagram" unless card.instagram_handle.to_s == ""
		classes.join(" ")
		# Sort classes
	end
end