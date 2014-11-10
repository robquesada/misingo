FactoryGirl.define do
  factory :lost_report do
    address "Cerca de aqui"
    owner "Pedro"
    description "MyText"
    phone_numbers ["12345678", "12345678"]
    reward 1
  end
end
