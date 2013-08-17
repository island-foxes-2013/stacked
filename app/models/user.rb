# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image_url  :string(255)
#  slug       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	extend FriendlyId	
	friendly_id :name, :use => :slugged
	
  attr_accessible :name, :image_url

  validates_presence_of :name

  has_many :authorizations

  def self.create_from_hash!(hash)
  	ap hash
  	create(name: hash['info']['name'], image_url: hash['info']['image'])
  end

end
