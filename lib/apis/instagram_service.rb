class InstagramService

  def get_posts(card)
    return [] unless card.instagram_id
    instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
    @response = instagram.user_recent_media(card.instagram_id)
    instagrams = []
    if @response
      ap @response
      @response.each_with_index do |instagram,i|
        instagrams[i] = {}
        instagrams[i][:provider]        = 'instagram'
        instagrams[i][:content]         = 'image'
        instagrams[i][:id]              = instagram['id']
        instagrams[i][:text]            = instagram['caption']['text'] if instagram['caption']
        instagrams[i][:thumbnail]       = instagram['images']['thumbnail']['url'] if instagram['images']
        instagrams[i][:small_image]     = instagram['images']['low_resolution']['url'] if instagram['images']
        instagrams[i][:standard_image]  = instagram['images']['standard_resolution']['url'] if instagram['images']
        instagrams[i][:created]         = instagram['created_time'].to_i
        instagrams[i][:url]             = instagram['link']
        instagrams[i][:user_id]         = ""       
      end
      ap instagrams
      instagrams
    else
      []
    end
  end
end

