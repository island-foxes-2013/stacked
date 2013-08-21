class CardCacheRefreshWorker
	include Sidekiq::Worker

	def perform(card)
		posts = Post.where(card: card).order("posted_at DESC")
		first_post = posts.first
		if posts.empty? or first_post.posted_at < (Time.now - 1.minute)
			posts = ServiceManager.get_posts(card)
			posts.each do |post|
				post_record = Post.new({})
				# save to DB
			end
			Post.where("id < ?", first_post.id).destroy
		end
	end

end