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

	let(:authorization) { create(:authorization) }
	let(:auth_hash) { { 'provider'=> "Twitter", 'uid'=> '1234567890', 'user_info'=>{ 'name'=>"Eric Chen" } } }

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

  describe "#self.find_from_hash" do 
  	# let(:auth_hash) { { 'provider'=> "Twitter", 'uid'=> '1234567890' } }
  	before do 
  		create(:authorization)
  	end
  	subject { Authorization.find_from_hash(auth_hash) }

  	context "given the info for an existing authorization" do 
  		it { should be_a Authorization }
  	end
  end

   describe "#self.create_from_hash" do 
  	# let(:auth_hash) { { 'provider'=> "Twitter", 'uid'=> '1234567890' } }
  	subject { Authorization.create_from_hash(auth_hash) }

  	context "given the info for an existing authorization" do 
  		it { should be_a Authorization }
  	end
  end

end