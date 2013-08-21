class TumblrService
  include HTTParty
  base_uri 'tumblr.com'
	
  def get_posts(card)
    return [] if card.tumblr_handle.nil? or card.tumblr_handle.blank?
    @response =  HTTParty.get("http://api.tumblr.com/v2/blog/#{card.tumblr_handle}.tumblr.com/posts?api_key=e1eKLVbWlHhCyqKgswQUvfnorgQMXmBBcfDCIG9ofleUkvKoZI")
    if @response
      tumbls = []
      @response['response']['posts'].each_with_index do |tumbl,i|
        tumbls[i] = {}
        tumbls[i][:provider] 	  = 'tumblr'
        tumbls[i][:url]         = tumbl['post_url']
        tumbls[i][:created]     = tumbl['timestamp']

        case tumbl['type']
        when "text"
          tumbls[i][:content]   = 'text'
          tumbls[i][:text]      = tumbl['title']
        when "quote"
          tumbls[i][:content]   = 'text'
          tumbls[i][:text]      = tumbl['text'] + " - " + tumbl['source']
        when "link"
          tumbls[i][:content]   = 'text'
          # tumbls[i][:text]      = "<a href='" + tumbls['url'] + "'>" + tumbls['description'] + "</a>"
        when "video"
          tumbls[i][:content]   = 'text'
          # tumbls[i][:text]      = "<a href='#{tumbls['source_url']}'>#{tumbls['caption']}</a>"
        when "photo"
          tumbls[i][:content]   = 'image'
          tumbls[i][:text]      = tumbl['caption']
          tumbls[i][:thumbnail] = tumbl['photos'][0]['alt_sizes'][5]['url']
          tumbls[i][:small_image] = tumbl['photos'][0]['alt_sizes'][3]['url']
          tumbls[i][:standard_image] = tumbl['photos'][0]['alt_sizes'][1]['url']
        else
        end
      end
      tumbls
    else
      []
    end
  end

end