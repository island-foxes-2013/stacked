hash = {
     "provider" => "twitter",
          "uid" => "287456668",
         "info" => {
         "nickname" => "mitcheljseaman",
             "name" => "Mitchel Seaman",
         "location" => "",
            "image" => "http://a0.twimg.com/profile_images/378800000309942638/c0ca634bfee58d506e223cc270d0385e_normal.jpeg",
      "description" => "",
             "urls" => {
          "Website" => nil,
          "Twitter" => "https://twitter.com/mitcheljseaman"
      }
  },
  "credentials" => {
       "token" => "287456668-wtyBO4NBZXkZ9PLeGo8NJ6oSuxAseldzvnBysO8A",
      "secret" => "kUWVMNtH1k1kbcUUS48VbdwolG0ssmbIr5GLlAkaUU"
  }
}
Authorization.create_from_hash(hash)

user = User.first

# Ravens Board
ravens = user.boards.create(name: 'Super Bowl Ravens', description: 'Ravens')

ravens_array = []
ravens_array << user.cards.create(name: 'Ravens', twitter_handle: 'ravens', instagram_handle: 'ravens')
ravens_array << user.cards.create(name: 'Joe Flacco', twitter_handle: 'teamflacco', instagram_handle: 'joeflacco_official')
ravens_array << user.cards.create(name: 'Ray Rice', twitter_handle: 'RayRice27', instagram_handle: 'rayrice27')

ravens_array.each do |card|
  ravens.cards << card
end

# One Card Board
onetrick = user.boards.create(name: 'One Trick Pony', description: 'faster than fast')
onetrick.cards << user.cards.create(name: 'Fast Company', twitter_handle: 'fastcompany', instagram_handle: 'fastcompany')

# Empty Board
empty = user.boards.create(name: 'Fill er up', description: 'no fallow grounds to seed')

# DBC Cohort Board, Island Foxes
islfox = user.boards.create(name: 'DBC Island Foxes', description: 'Island fox cohort, Graduating Aug 2013.')

islfox_array = []
islfox_array << user.cards.create(name: 'Eric Chen', twitter_handle: 'ericchen0121', instagram_handle: 'ericchen0121', tumblr_handle: 'ericschen')
islfox_array << user.cards.create(name: 'Adam Loo', twitter_handle: 'adamloo2')
islfox_array << user.cards.create(name: 'Greg Varias', twitter_handle: '180AD')
islfox_array << user.cards.create(name: 'Dan Willems', twitter_handle: 'dmkwillems', tumblr_handle: 'danielwillems')
islfox_array << user.cards.create(name: 'Clint Mullins', twitter_handle: 'clintfmullins')
islfox_array << user.cards.create(name: 'C Marquardt', twitter_handle: 'cmarquardt86')
islfox_array << user.cards.create(name: 'Jake Danforth', twitter_handle: 'SoEzPz')
islfox_array << user.cards.create(name: 'Clint Mullins', twitter_handle: 'mariabpiper')
islfox_array << user.cards.create(name: 'Mitch Seaman', twitter_handle: 'mitcheljseaman', tumblr_handle: 'rebootcamp')


islfox_array.each do |card|
  islfox.cards << card
end

# Martins
martins = user.boards.create(name: 'Purple Martins', description: 'Next in line')

martins_array = []
martins_array << user.cards.create(name: 'Anirudh Dhullipalla', twitter_handle: 'anirudh_eka', tumblr_handle: 'poetprogrammer')
martins_array << user.cards.create(name: 'Chapman Snowden', twitter_handle: 'ChapmanSnowden', tumblr_handle: 'ChapmanSnowden')
martins_array << user.cards.create(name: 'Colleen McCloskey', twitter_handle: 'CodingColleen')
martins_array << user.cards.create(name: 'Daniel L Hossom', twitter_handle: 'Syn_Splendidus', tumblr_handle: 'syn-splendidus')
martins_array << user.cards.create(name: 'Eric Kristensen', twitter_handle: 'ELKristensen', tumblr_handle: 'elkristensen')

martins_array.each do |card|
  martins.cards << card
end
