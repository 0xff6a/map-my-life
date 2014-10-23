Given(/^I have logged at least one workout$/) do
  FactoryGirl.create(:run)
end

Then(/^I should see a training pace widget$/) do
  within('.training_pace') do
    expect(page).to have_content('Easy')
  end
end

Then(/^the correct training paces based on my benchmark$/) do
  within('.training_pace') do
    expect(page).to have_content('13.36')
  end
end

Given(/^I have not logged any workouts$/) do
  #Nothing to do here
end

Then(/^I should see a message prompting me to add a workout$/) do
  expect(page).to have_content(
      'Please log at least one workout to benchmark your training paces')
end

Given(/^I have saved a training pace$/) do
  FactoryGirl.create(:training_pace)
end

When(/^I visit the homepage$/) do
  visit runs_path
end

Then(/^the description for each pace$/) do
  page.find('.training_pace_popover').hover
  expect(page).to have_content('an easier pace')
end