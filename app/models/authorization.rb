# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authorization < ActiveRecord::Base

	attr_accessible :user, :uid, :provider

  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_from_hash(hash)
    ap "in auth find from hash"
  	find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    ap "in auth create from hash"
  	user ||= User.create_from_hash!(hash)
  	Authorization.create(user: user, uid: hash['uid'], provider: hash['provider'])
  end

end
