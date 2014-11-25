FactoryGirl.define do

  factory :lost_report do
    address 'Cerca de aquí'
    owner 'Pedro'
    description 'MyText'
    phone_numbers %w(12345678 12345678)
    reward 1

    after(:create) do |lost_report|
      lost_report.pet = create(:pet)
      lost_report.province = create(:province)
    end
  end

  factory :invalid_lost_report, parent: :lost_report do
    phone_numbers ['', '']
  end

end
