Given(/^the following events exist$/) do |events|
  Event.create!(events.hashes)
end

When(/^I edit the event '(.*)'$/) do |name|
  click_event_button name, '.edit-event'
end

When(/^I view and edit the event '(.*)'$/) do |name|
  click_event_button name, '.view-event'
  click_link('Edit')
end
