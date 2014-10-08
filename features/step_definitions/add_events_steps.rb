
When(/^I resize window to large$/) do 
	page.driver.browser.manage.window.resize_to(1200, 500)
end

When(/^I resize window to small$/) do 
	page.driver.browser.manage.window.resize_to(600, 500)
end

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

Then(/^I should see the following events$/) do |expected_events|
	actual_events = [expected_events.raw.first]
	expect(page).to have_css('.event-row', count: expected_events.rows().count)
	rows = all('.event-row')
	rows.each do |row|
		name = row.find('.event-name').text.strip

		if row.has_selector?('.event-description')
			description = row.find('.event-description').text.strip
			actual_events.push([name, description])
		else
			actual_events.push([name])
		end	
	end	
  	expected_events.diff! actual_events
  
end
