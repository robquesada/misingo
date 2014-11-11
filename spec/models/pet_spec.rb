require 'rails_helper'

describe Pet, "validations" do
  
  subject { FactoryGirl.create(:pet) }

  it { should belong_to(:user) }
  it { should belong_to(:breed) }
  it { should have_one(:lost_report) }
  it { should have_attached_file(:avatar) }
  it { should allow_value('Pipo', 'Pepe').for(:name) }
  it { should_not allow_value('Pepe Soto').for(:name) }
  it { should_not allow_value('123').for(:name) }

end
