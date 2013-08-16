# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :authorizations

  def self.create_from_hash!(hash)
  	create(name: hash['info']['name'])
  end

end
