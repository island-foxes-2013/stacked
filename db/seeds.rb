# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

islfox = Board.create(name: 'DBC Island Foxes', description: 'Island fox cohort, Graduating Aug 2013.')

islfox_cards = []
islfox_cards << Card.create(name: 'Eric Chen', twitter_handle: 'ericchen0121')
islfox_cards << Card.create(name: 'Adam Loo', twitter_handle: 'adamloo2')
islfox_cards << Card.create(name: 'Greg Varias', twitter_handle: '180AD')
islfox_cards << Card.create(name: 'Dan Willems', twitter_handle: 'dmkwillems')
islfox_cards << Card.create(name: 'Clint Mullins', twitter_handle: 'clintfmullins')

islfox_cards.each do |fox|
  islfox.cards << fox
end