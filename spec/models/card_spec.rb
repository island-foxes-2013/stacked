# == Schema Information
#
# Table name: cards
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  twitter_handle :string(255)
#  slug           :string(255)      not null
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Card do
  it { should be_a Card }
  it { should validate_presence_of(:name) }
  it { should have_many(:boards) }
end


