Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^no workouts have been added$/) do
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I click "(.*?)"$/) do |object|
  click_on object
end

When(/^I fill in the workout details$/) do
  fill_in 'Activity', with: 'Running'
  fill_in 'Date', with: '5/10/2014'
  fill_in 'Duration', with: 60
  fill_in 'Intensity', with: 'High'
end

Then(/^I should see my workout listed$/) do
  expect(page).to have_content('Running')
  expect(page).to have_content('5/10/2014')
  expect(page).to have_content('60')
  expect(page).to have_content('High')
end

When(/^I update the workout details$/) do
  fill_in 'Activity', with: 'Hiking'
end

Then(/^I should see the updated details listed$/) do
  expect(page).to have_content('Hiking')
  expect(page).not_to have_content('Running')
end

Given(/^I have added a workout$/) do
  FactoryGirl.create(:workout)
end