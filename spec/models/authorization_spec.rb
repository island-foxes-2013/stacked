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

require 'spec_helper'

describe Authorization do

  let(:authorization) { create(:authorization) }
  let(:auth_hash) { { 'provider'=> "Twitter", 'uid'=> '1234567890', 'info'=>{ 'name'=>"Eric Chen" } } }

  it { should be_a Authorization }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }

  describe "#new" do 
    subject { authorization }

    it { should be_a Authorization }

    its(:user) { should be_a User }
  end

  describe ".find_from_hash" do 
    before do 
      create(:authorization)
    end
    subject { Authorization.find_from_hash(auth_hash) }

    context "given the info for an existing authorization" do 
      it { should be_a Authorization }
    end
  end

   describe ".create_from_hash" do 
    subject { Authorization.create_from_hash(auth_hash) }

    context "given the info for an existing authorization" do 
      it { should be_a Authorization }
    end
  end

end
