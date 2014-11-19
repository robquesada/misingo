require 'rails_helper'

describe User, "validations" do
  subject { FactoryGirl.create(:user) }
  it { should have_many(:pets).dependent(:destroy) }
  it { should_not allow_value('email@x').for(:email) }
  it { should_not allow_value('123123').for(:email) }
end
