module CardHelper
	def instagram_id(username)
		Instagram.user_search(username,count:1)[0]['id']
	end
end