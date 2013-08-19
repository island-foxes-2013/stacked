# Ravens Board
ravens = Board.create(name: 'Super Bowl Champion Ravens', description: 'Ravens rock Atlanta Falcons')

ravens = []
ravens_array << Card.create(name: 'Ravens', twitter_handle: 'ravens', instagram_handle: 'ravens')
ravens_array << Card.create(name: 'Joe Flacco', twitter_handle: 'teamflacco', instagram_handle: 'joeflacco_official')
ravens_array << Card.create(name: 'Ray Rice', twitter_handle: 'RayRice27', instagram_handle: 'rayrice27')

ravens.each do |card|
  ravens.cards << card
end

# One Card Board
onetrick = Board.create(name: 'One Trick Pony', description: 'faster than fast')
onetrick.cards << Card.create(name: 'Fast Company', twitter_handle: 'fastcompany', instagram_handle: 'fastcompany')

# Empty Board
empty = Board.create(name: 'Fill er up', description: 'no fallow grounds to seed')

# DBC Cohort Board, Island Foxes
islfox = Board.create(name: 'DBC Island Foxes', description: 'Island fox cohort, Graduating Aug 2013.')

islfox_array = []
islfox_array << Card.create(name: 'Eric Chen', twitter_handle: 'ericchen0121', instagram_handle: 'erichen0121')
islfox_array << Card.create(name: 'Adam Loo', twitter_handle: 'adamloo2')
islfox_array << Card.create(name: 'Greg Varias', twitter_handle: '180AD')
islfox_array << Card.create(name: 'Dan Willems', twitter_handle: 'dmkwillems')
islfox_array << Card.create(name: 'Clint Mullins', twitter_handle: 'clintfmullins')
islfox_array << Card.create(name: 'C Marquardt', twitter_handle: 'cmarquardt86')
islfox_array << Card.create(name: 'Jake Danforth', twitter_handle: 'SoEzPz')
islfox_array << Card.create(name: 'Clint Mullins', twitter_handle: 'mariabpiper')

islfox_array.each do |card|
  islfox.cards << card
end
