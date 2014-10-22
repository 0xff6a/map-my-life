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
    expect(page).to have_content('5.08')
    expect(page).to have_content('4.16')
    expect(page).to have_content('3.5')
    expect(page).to have_content('3.33')
    expect(page).to have_content('5.48')
  end
end