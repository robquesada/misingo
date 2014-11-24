When(/^I am on the page for add the information of the lost$/) do
  @pet = FactoryGirl.create(:pet)
  FactoryGirl.create(:province)
  visit new_pet_lost_report_path(@pet)
end

When(/^enter "(.*?)" in the owner's name field$/) do |owner_name|
  fill_in('lost_report_owner', with: owner_name)
end

When(/^enter "(.*?)" in the phone field$/) do |phone_number|
  fill_in('lost_report_phone_numbers', with: phone_number, match: :prefer_exact)
end

When(/^select 'Alajuela' in the province select$/) do
  select("Alajuela", from: 'lost_report_province_id')
end

When(/^enter "(.*?)" in the address field$/) do |address|
  fill_in('lost_report_address', with: address)
end

When(/^enter "(.*?)" in the description field$/) do |description|
  fill_in('lost_report_description', with: description)
end

When(/^select 'Ofrezco recompensa' checkbox option$/) do
  check('lost_report_reward')
end

When(/^click "(.*?)" button$/) do |add_lost_report_button|
  click_on(add_lost_report_button, match: :first)
end

Then(/^I will be redirected to the lost report page$/) do
  expect(current_path).to eq(pet_lost_report_path(@pet))
end
