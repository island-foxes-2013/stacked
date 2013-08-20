module CardHelper
	def get_instagram_id(instagram_handle)
		search_results = Instagram.user_search(instagram_handle,count:1)
		return search_results[0]['id'] if search_results[0]
		nil
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