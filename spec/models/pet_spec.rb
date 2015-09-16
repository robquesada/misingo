require 'rails_helper'

describe Pet, 'validations' do
  subject { FactoryGirl.create(:pet, name: 'bobby') }

  it { should belong_to(:user) }
  it { should belong_to(:breed) }
  it { should have_one(:lost_report).dependent(:destroy) }
  it { should have_attached_file(:avatar) }
  it { should allow_value('Pipo', 'Pepe').for(:name) }
  it { should_not allow_value('Pepe Soto').for(:name) }
  it { should_not allow_value('123').for(:name) }
  its(:name) { should eq 'Bobby' }
end

# == Schema Information
#
# Table name: pets
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime
#  updated_at          :datetime
#  sex                 :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :integer
#  breed_id            :integer
#
