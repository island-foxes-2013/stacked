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
    ap posts.sort_by { |post| -post[:created] }.map{ |post| post[:created] }
    posts.sort_by { |post| -post[:created] }
	end

end

ServiceManager.configure do |config|
  config.services = [:twitter, :instagram]
end


# class APIFactory
#   def self.get(service_name)
#     SERVICES[service_name].new
#   end
# end

# class BaseAPI
#   def posts
#     # do whatever initialization is necessary
#     get_posts
#   end

#   def get_posts
#     raise NotImplementedError, "subclasses must define this"
#   end
# end
