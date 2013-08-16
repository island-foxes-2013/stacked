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

require 'spec_helper'

describe Authorization do
  it { should be_a Authorization }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }

end