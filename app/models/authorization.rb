# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authorization < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider


end
