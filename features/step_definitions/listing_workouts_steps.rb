Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^no workouts have been added$/) do
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end