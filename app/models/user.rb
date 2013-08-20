# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  username     :string(255)
#  slug         :string(255)      not null
#  primary_card :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base

	extend FriendlyId	
	friendly_id :name, :use => :slugged

	attr_accessible :name, :username

  validates_presence_of :name

  has_many :authorizations
  has_many :boards
  has_many :cards
  has_one :primary_card, class_name: "Card"

  before_save :create_primary_card

  def self.create_from_hash!(hash)
  	create(name: hash['info']['name'], username: hash['info']['nickname'])
  end

  def create_primary_card
    prim_card = Card.new(name: name)
    prim_card.save
    self.primary_card = prim_card
  end
end
