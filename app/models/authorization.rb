# == Schema Information
#
# Table name: authorizations
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  nickname     :string(255)
#  oauth_token  :string(255)
#  oauth_secret :string(255)
#

class Authorization < ActiveRecord::Base

	attr_accessible :user, :uid, :provider, :nickname

  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_from_hash(hash)
  	find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
  	user ||= User.create_from_hash!(hash)
  	auth = Authorization.create(user: user, uid: hash['uid'], provider: hash['provider'])
    if auth.provider == 'twitter'
      auth.nickname = hash['info']['nickname'] 
      auth.oauth_token = hash['credentials']['token']
      auth.oauth_secret = hash['credentials']['secret']
      auth.save
    else
      auth.nickname = hash['nickname']
      auth.save
    end
    user.create_primary_card
    auth
  end

end
