class ServiceManagerWorker 
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(card_id)
		card = Card.find(card_id)
		posts = ServiceManager.get_posts(Card.find(card_id))
		cached_posts = Post.create({updated_epoch: posts[:updated_epoch],
														    post_json:     posts[:posts],
														    card: 				 card})
		Post.where("card_id = ? AND id < ?", card_id, cached_posts.id).destroy_all
	end
end