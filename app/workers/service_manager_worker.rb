class ServiceManagerWorker 
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(card_id)
		card = Card.find(card_id)
		posts = Post.find_by_card_id(card_id)
		if !posts || posts.updated_epoch < (Time.now - 1.minute).to_i
			posts.destroy if posts

			posts = ServiceManager.get_posts(card)
			Post.create({updated_epoch: posts[:updated_epoch],
								   post_json:     posts[:posts],
								   card: 				  card})
		end
		[].to_json
	end
end