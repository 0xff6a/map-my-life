Then(/^I should see a list of workouts$/) do
  expect(page).to have_content('9.74km')
  expect(page).to have_content('5.56min/km')
end