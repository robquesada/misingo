require 'rails_helper'

describe LostReport, 'validations' do
  subject { FactoryGirl.create(:lost_report, owner: 'Pepe',
                                             description: 'Es grande',
                                             address: 'Cerca de la casa de don Josefino',
                                             phone_numbers: ['12345678', ' 1234-5678']) }

  it { should be_valid }
  it { should belong_to(:province) }
  it { should belong_to(:pet) }
  it { should belong_to(:user) }
  it { should serialize(:phone_numbers) }
  it { should allow_value('Pepe', 'Pepe Soto').for(:owner) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  it { should accept_nested_attributes_for(:pet) }
  its(:owner) { should eq 'Pepe' }
end

# == Schema Information
#
# Table name: lost_reports
#
#  id            :integer          not null, primary key
#  address       :text
#  reward        :integer
#  owner         :string
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  province_id   :integer
#  pet_id        :integer
#  phone_numbers :text
#  user_id       :integer
#  found         :boolean          default(FALSE), not null
#
