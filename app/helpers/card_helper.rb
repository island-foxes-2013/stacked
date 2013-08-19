module CardHelper
	def instagram_id(username)
		Instagram.user_search(username,count:1)[0]['id']
	end

	def classify(card)
		classes = []

		# Filter classes
		classes << "twitter" if card.twitter_handle[0]
		classes << "instagram" if card.instagram_handle[0]
		classes.join(" ")
		# Sort classes
	end
end