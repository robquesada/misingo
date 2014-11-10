require 'rails_helper'

describe LostReport, "validations" do
  
  subject { FactoryGirl.create(:lost_report, owner: "Pepe",
                                             description: "Es grande",
                                             address: "Cerca de la casa de don Josefino",
                                             phone_numbers: ["12345678"]) }

  it { should be_valid }
  it { should belong_to(:province) }
  it { should belong_to(:pet) }
  it { should serialize(:phone_numbers) }
  it { should allow_value('Pepe', 'Pepe Soto').for(:owner) }
  it { should_not allow_value('123').for(:owner) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  its(:owner){ should eq "Pepe" }

end
