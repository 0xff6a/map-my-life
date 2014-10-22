Given(/^I have logged at least one workout$/) do
  FactoryGirl.create(:run)
end

Then(/^I should see a training pace widget$/) do
  within('.training_pace') do
    expect(page).to have_content('Easy')
    expect(page).to have_content('Tempo')
    expect(page).to have_content('VO2 Max')
    expect(page).to have_content('Speed Form')
    expect(page).to have_content('Long Run')
  end
end

Then(/^the correct training paces based on my benchmark$/) do
  within('.training_pace') do
    expect(page).to have_content('13.36')
    expect(page).to have_content('11.48')
    expect(page).to have_content('10.52')
    expect(page).to have_content('10.11')
    expect(page).to have_content('14.51')
  end
end

Given(/^I have not logged any workouts$/) do
  #Nothing to do here
end

Then(/^I should see a message prompting me to add a workout$/) do
  expect(page).to have_content(
      'Please log at least one workout to benchmark your training paces')
end