FactoryGirl.define do

  factory :lost_report do
    address 'Cerca de aquí'
    owner 'Pedro'
    description 'MyText'
    phone_numbers %w(12345678 12345678)
    reward 1
    pet
    province
  end

  factory :invalid_lost_report, parent: :lost_report do
    phone_numbers ['', '']
  end

end

# == Schema Information
#
# Table name: lost_reports
#
#  id            :integer          not null, primary key
#  address       :text
#  reward        :integer
#  owner         :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  province_id   :integer
#  pet_id        :integer
#  phone_numbers :text
#
