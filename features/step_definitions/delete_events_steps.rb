When(/^I delete the event '(.*)'$/) do |name|
  click_event_button name, '.delete-event'
end


When(/^I view and delete the event '(.*)'$/) do |name|
  click_event_button name, '.view-event'
  click_link('Delete')
end