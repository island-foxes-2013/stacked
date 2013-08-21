

require 'spec_helper'

describe User do
  it { should be_a User }
  it { should validate_presence_of(:name) }

  it { should have_many(:authorizations) }

  context "#new" do 
  	subject { create(:user) }

  	it { should be_a User }

  end
end
