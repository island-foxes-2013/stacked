# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Board do
  it { should be_a Board }
  it { should validate_presence_of(:name) }
  it { should have_many(:cards) }
end
