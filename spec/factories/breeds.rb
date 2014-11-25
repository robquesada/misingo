FactoryGirl.define do
  factory :breed do
    name 'Zaguate'

    after(:create) do |breed|
      breed.animal_type = create(:animal_type)
    end
  end
end
