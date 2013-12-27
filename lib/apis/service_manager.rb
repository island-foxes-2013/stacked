class ServiceManager
  class Configuration
    attr_accessor :services
  end

  def self.configure(&block)
    raise ArgumentError, "block takes only one config argument" unless block.arity == 1
    @@config = Configuration.new
    yield @@config
  end

	def self.get_posts(card)
    posts = []
    return posts if @@config.services.blank?
    @@config.services.each do |service_name|
      klass = Kernel.const_get("#{service_name}_service".camelize)
      service = klass.new
      raise "#{service_name.to_s} API service must implement #posts" unless service.respond_to? :get_posts
      posts += service.get_posts(card)
    end
    posts = posts.sort_by { |post| -post[:created] }
    {posts: posts.to_json, updated_epoch: posts[0][:created]}
	end

end

ServiceManager.configure do |config|
  config.services = [:twitter, :instagram, :tumblr]
end
