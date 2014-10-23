Then(/^I should see a list of workouts$/) do
  expect(page).to have_content('9.74km')
  expect(page).to have_content('5.56min/km')
end

Given(/^I have loaded my workouts from MMF$/) do
  visit runs_path
end

Given(/^I have not logged any new workouts$/) do
  #nothing to do here
end

Then(/^the number of workouts should not change$/) do
  initial = page.all('.workout').count
  click_link 'Load from MMF'
  expect(page.all('.workout').count).to eq initial
end