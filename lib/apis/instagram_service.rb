class InstagramService

  def get_posts(card)
    return [] unless card.instagram_id
    instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
    @response = instagram.user_recent_media(card.instagram_id)
    instagrams = []
    if @response
      @response.each_with_index do |instagram,i|
        instagrams[i] = {}
        instagrams[i][:provider]        = 'instagram'
        instagrams[i][:id]              = instagram['id']
        instagrams[i][:text]            = instagram['caption']['text']
        instagrams[i][:thumbnail]       = instagram['images']['thumbnail']['url']
        instagrams[i][:small_image]     = instagram['images']['low_resolution']['url']
        instagrams[i][:standard_image]  = instagram['images']['standard_resolution']['url']
        instagrams[i][:created]         = DateTime.parse(instagram['created_time']).to_time.to_i
        instagrams[i][:url]             = instagram['link']
      end
      instagrams
    else
      []
    end
  end
end

