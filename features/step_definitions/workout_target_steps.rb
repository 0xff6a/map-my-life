When(/^I fill in the target details$/) do
  fill_in 'Pace', with: 4.05
  fill_in 'Pace metric', with: 'min/km'
  fill_in 'Distance', with: 5
  fill_in 'Distance metric', with: 'km'
  fill_in 'Due date', with: '2014-12-01'
end

Then(/^I should see the target next to my workout$/) do
  within('.workout') do
    expect(page).to have_content('4.05min/km')
    expect(page).to have_content('5.0km')
    expect(page).to have_content('2014-12-01')
  end
end