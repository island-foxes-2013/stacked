class InstagramService

  def get_posts(card)
    p "*" * 100
    p "IN INSTAGRAM SERVICE"
    return [] unless card.instagram_id
    instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
    p ENV['INSTAGRAM_TOKEN']
    p "*" * 100
    @response = instagram.user_recent_media(card.instagram_id)
    instagrams = []
    if @response
      p "RESPONSE TRUE"
      @response.each_with_index do |instagram,i|
        instagrams[i] = {}
        instagrams[i][:provider]        = 'instagram'
        instagrams[i][:id]              = instagram['id']
        instagrams[i][:text]            = instagram['caption']['text'] if instagram['caption']
        instagrams[i][:thumbnail]       = instagram['images']['thumbnail']['url'] if instagram['images']
        instagrams[i][:small_image]     = instagram['images']['low_resolution']['url'] if instagram['images']
        instagrams[i][:standard_image]  = instagram['images']['standard_resolution']['url'] if instagram['images']
        instagrams[i][:created]         = instagram['created_time'].to_i
        instagrams[i][:url]             = instagram['link']
      end
      instagrams
    else
      []
    end
  end
end

