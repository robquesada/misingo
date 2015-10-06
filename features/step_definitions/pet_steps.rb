Given(/^I want to add a lost pet$/) do
  visit root_path
end

When(/^I click "(.*?)"$/) do |add_pet_button|
  click_on(add_pet_button, match: :first)
end

When(/^inserts an image$/) do
  attach_file('image-selector', 'spec/fixtures/cat.jpg')
end

When(/^enter "(.*?)" in the name field$/) do |pet_name|
  fill_in('nombre', with: pet_name)
end

When(/^select 'Hembra' in the sex field$/) do
  choose('pet_sex_hembra')
end

When(/^select "(.*?)" in the animal type field$/) do |pet_animal_type|
  select(pet_animal_type, from: 'animal_type_id')
end

When(/^select "(.*?)" in the breed field$/) do |pet_breed|
  select(pet_breed, from: 'pet_breed_id')
end

When(/^click "(.*?)" button to finish$/) do |accept_button|
  click_on(accept_button)
end

Then(/^I will see the lost report form page$/) do
  expect(current_path).to eq(new_pet_lost_report_path(Pet.last))
end
