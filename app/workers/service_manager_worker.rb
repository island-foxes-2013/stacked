class ServiceManagerWorker 
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(card_id)
		card = Card.find(card_id)
		posts = Post.find_by_card_id(card_id)
		if !posts || posts.updated_epoch < (Time.now - 1.minute).to_i
			posts.destroy if posts
			# card = Card.find(card_id)
			posts = ServiceManager.get_posts(card)
			# ap "HELLO"
			# ap posts
			Post.create({updated_epoch: posts[:updated_epoch],
								   post_json:     posts,
								   card: 				  card})
		end
	end
end