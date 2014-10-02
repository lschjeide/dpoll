

When(/^I go to the events page$/) do
   visit "/events" 
end

When(/^I fill in '(.*)' with '(.*)'$/) do |field_name, field_value|
  find(:fillable_field, field_name)
  fill_in field_name, with: field_value
end

When(/^I click on (.+)/) do |button|
   find_a_button(button).click
end

Then(/^I should see (.+) in the list$/) do |text|
  expect(page).to have_content(text)
end